@REM maven-dependency-plugin 2.8 cannot add parent poms correctly

@ECHO OFF

CALL mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:sources || EXIT /B
REM CALL mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:resolve -Dclassifier=javadoc || EXIT /B
CALL mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:resolve || EXIT /B

RD /S /Q target
DEL %1-maven-dependencies.zip

CALL mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:copy-dependencies -Dmdep.addParentPoms=true -Dmdep.copyPom=true -Dmdep.useRepositoryLayout=true -Dclassifier=sources || EXIT /B
REM CALL mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:copy-dependencies -Dmdep.addParentPoms=true -Dmdep.copyPom=true -Dmdep.useRepositoryLayout=true -Dclassifier=javadoc || EXIT /B
CALL mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:copy-dependencies -Dmdep.addParentPoms=true -Dmdep.copyPom=true -Dmdep.useRepositoryLayout=true || EXIT /B

COPY pom.xml %1-maven-dependencies-pom.xml

CD target\dependency
..\..\..\7za.exe a -r ..\..\%1-maven-dependencies.zip *
CD ..\..