# maven-dependency-plugin 2.8 cannot add parent poms correctly

export PATH=/opt/apache-maven-3.3.9/bin:$PATH

mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:sources
#mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:resolve -Dclassifier=javadoc
mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:resolve

rm -rf target
rm -f $1-maven-dependencies.zip
rm -f $1-maven-dependencies-pom.xml

mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:copy-dependencies -Dmdep.addParentPoms=true -Dmdep.copyPom=true -Dmdep.useRepositoryLayout=true -Dclassifier=sources
#mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:copy-dependencies -Dmdep.addParentPoms=true -Dmdep.copyPom=true -Dmdep.useRepositoryLayout=true -Dclassifier=javadoc
mvn org.apache.maven.plugins:maven-dependency-plugin:2.10:copy-dependencies -Dmdep.addParentPoms=true -Dmdep.copyPom=true -Dmdep.useRepositoryLayout=true

cp pom.xml $1-maven-dependencies-pom.xml

cd target/dependency
7z a -r ../../$1-maven-dependencies.zip *
cd ../..
