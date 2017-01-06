@REM maven-dependency-plugin 2.8 cannot add parent poms correctly

@ECHO OFF

CALL mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:sources
REM CALL mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:resolve -Dclassifier=javadoc
CALL mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:resolve

RD /S /Q target
DEL %1-maven-dependencies.zip

CALL mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:copy-dependencies -Dmdep.addParentPoms=true -Dmdep.copyPom=true -Dmdep.useRepositoryLayout=true -Dclassifier=sources
REM CALL mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:copy-dependencies -Dmdep.addParentPoms=true -Dmdep.copyPom=true -Dmdep.useRepositoryLayout=true -Dclassifier=javadoc
CALL mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:copy-dependencies -Dmdep.addParentPoms=true -Dmdep.copyPom=true -Dmdep.useRepositoryLayout=true

COPY pom.xml %1-maven-dependencies-pom.xml

CD target\dependency
..\..\..\7za.exe a -r ..\..\%1-maven-dependencies.zip *
CD ..\..