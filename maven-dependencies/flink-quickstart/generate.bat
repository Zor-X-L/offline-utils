SET FLINK_VER=1.5.2

CALL mvn archetype:generate -DarchetypeGroupId=org.apache.flink -DarchetypeArtifactId=flink-quickstart-java -DarchetypeVersion=%FLINK_VER% -DinteractiveMode=false -DgroupId=org.apache.flink -DartifactId=flink-quickstart-java
CALL mvn archetype:generate -DarchetypeGroupId=org.apache.flink -DarchetypeArtifactId=flink-quickstart-scala -DarchetypeVersion=%FLINK_VER% -DinteractiveMode=false -DgroupId=org.apache.flink -DartifactId=flink-quickstart-scala