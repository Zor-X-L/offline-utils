@REM maven-dependency-plugin 2.8 cannot add parent poms correctly
@REM maven-dependency-plugin 3.0.0 and 3.0.1 cannot run copy-dependencies reporting missing com.sun.java:tools:pom:1.8.0_131

REM CALL mvn org.apache.maven.plugins:maven-dependency-plugin:3.0.0:sources || EXIT /B
REM CALL mvn org.apache.maven.plugins:maven-dependency-plugin:3.0.0:resolve || EXIT /B

RD /S /Q target
DEL %1-maven-dependencies.zip

CALL mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:copy-dependencies -Dmdep.addParentPoms=true -Dmdep.copyPom=true -Dmdep.useRepositoryLayout=true -Dclassifier=sources || EXIT /B
CALL mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:copy-dependencies -Dmdep.addParentPoms=true -Dmdep.copyPom=true -Dmdep.useRepositoryLayout=true || EXIT /B

COPY pom.xml %1-maven-dependencies-pom.xml

CD target\dependency
DEL /S /Q maven-metadata-local.xml || EXIT /B
%~dp0\7za.exe a -r ..\..\%1-maven-dependencies.zip *
CD ..\..