#/bin/sh
#Install Build Tools
sudo apt-get -y install build-essential
sudo apt-get -y install packaging-dev

#Install Java

sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get -y update
sudo apt-get install -y openjdk-7-jdk
sudo apt-get -y update --fix-missing
sudo apt-get install -y openjdk-7-jdk

sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get -y update
sudo apt-get install -y openjdk-8-jdk
sudo apt-get -y update --fix-missing
sudo apt-get install -y openjdk-8-jdk

# sudo add-apt-repository -y ppa:webupd8team/java
# sudo apt-get -y update
# sudo apt-get install -y oracle-java7-installer

# sudo add-apt-repository -y ppa:webupd8team/java
# sudo apt-get -y update
# sudo apt-get install -y oracle-java8-installer

#Install Java build tools
sudo apt-get -y install ant
sudo apt-get -y install maven
sudo apt-get -y install gradle

sudo apt-get -y install libunwind8 libcurl3

mkdir ~/downloads
cd ~/downloads
wget https://github.com/Microsoft/vsts-agent/releases/download/v2.101.1/vsts-agent-ubuntu.14.04-x64-2.101.1.tar.gz
wget http://security.ubuntu.com/ubuntu/pool/main/i/icu/libicu52_52.1-8ubuntu0.2_amd64.deb
sudo dpkg -i libicu52_52.1-8ubuntu0.2_amd64.deb

mkdir ~/vsts-agent
cd ~/vsts-agent
tar xzf ~/downloads/vsts-agent-ubuntu*
sudo bin/Agent.Listener --unattended --runasservice --replace --acceptteeeula --url $1 --auth PAT --token $2 --pool $3 --agent $4

