SET FLINK_VER=1.3.1

CALL mvn archetype:generate -DarchetypeGroupId=org.apache.flink -DarchetypeArtifactId=flink-quickstart-java -DarchetypeVersion=%FLINK_VER% -DinteractiveMode=false -DgroupId=flink_quickstart -DartifactId=java
CALL mvn archetype:generate -DarchetypeGroupId=org.apache.flink -DarchetypeArtifactId=flink-quickstart-scala -DarchetypeVersion=%FLINK_VER% -DinteractiveMode=false -DgroupId=flink_quickstart -DartifactId=scala