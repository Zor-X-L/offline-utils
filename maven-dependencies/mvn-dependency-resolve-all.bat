SET WORKINGDIR=%CD%

MD D:\mvn-dependency-resolve

PUSHD D:\mvn-dependency-resolve || EXIT /B
DEL /S /Q * || EXIT /B

POPD || EXIT /B
CALL mvn -Dmaven.repo.local=D:\mvn-dependency-resolve org.apache.maven.plugins:maven-dependency-plugin:2.10:sources || EXIT /B
CALL mvn -Dmaven.repo.local=D:\mvn-dependency-resolve org.apache.maven.plugins:maven-dependency-plugin:2.10:resolve || EXIT /B
CALL mvn -Dmaven.repo.local=D:\mvn-dependency-resolve org.apache.maven.plugins:maven-dependency-plugin:2.10:resolve-plugins || EXIT /B

PUSHD D:\mvn-dependency-resolve || EXIT /B
DEL /S /Q _remote.repositories || EXIT /B
DEL /S /Q *.sha1 || EXIT /B
%~dp0\7za.exe a -r %WORKINGDIR%\%1-maven-dependencies.zip * || EXIT /B

POPD || EXIT /B
DEL /Q %1-maven-dependencies-pom.xml
COPY pom.xml %1-maven-dependencies-pom.xml || EXIT /B