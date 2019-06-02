cd /opt/GENESIS/TOOLS
sudo apt-get install maven
sudo apt-get install -y software-properties-common
sudo apt-apt-repository -y ppa:webupd8team/java
sudo apt-get -y update
sudo apt-get install -y oracle-java8-installer
sudo apt-get install groovy
  
cd Cytomine_src/
git clone'https://github.com/cytomine/Cytomine-java-client.git' 
unzip Cytomine-java-client-master.zip
cd Cytomine-java-client/
mvn -U clean install
  
mkdir test
cp target/cytomine-java-client-1.0-SNAPSHOT-jar-with-dependencies.jar ../../test/
cd ../../test/



