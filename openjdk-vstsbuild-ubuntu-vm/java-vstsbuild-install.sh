#!/bin/sh



#Install Build Tools

echo "Installing build-essential package" > /home/$5/install.progress.txt
sudo apt-get -y install build-essential

echo "Installing packaging-dev package" >> /home/$5/install.progress.txt
sudo apt-get -y install packaging-dev



#Install Java

echo "Installing openjdk-7-jdk package" >> /home/$5/install.progress.txt

sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get -y update
sudo apt-get install -y openjdk-7-jdk
sudo apt-get -y update --fix-missing
sudo apt-get install -y openjdk-7-jdk

echo "Installing openjdk-8-jdk package" >> /home/$5/install.progress.txt

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
echo "Installing ant package" >> /home/$5/install.progress.txt
sudo apt-get -y install maven
echo "Installing maven package" >> /home/$5/install.progress.txt
sudo apt-get -y install gradle
echo "Installing gradle package" >> /home/$5/install.progress.txt

# Install NodeJS, npm, and gulp
echo "Installing NodeJS package" >> /home/$5/install.progress.txt
sudo curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
echo "Installing gulp package" >> /home/$5/install.progress.txt
sudo npm install -g gulp
sudo npm install gulp --save-dev



# Install VSTS build agent dependencies

echo "Installing libunwind8 and libcurl3 package" >> /home/$5/install.progress.txt
sudo apt-get -y install libunwind8 libcurl3



# Download VSTS build agent and required security patch

echo "Installing VSTS Build agent package" >> /home/$5/install.progress.txt
sudo -u $5 mkdir /home/$5/downloads
cd /home/$5/downloads
sudo -u $5 wget https://github.com/Microsoft/vsts-agent/releases/download/v2.101.1/vsts-agent-ubuntu.14.04-x64-2.101.1.tar.gz
sudo -u $5 wget http://security.ubuntu.com/ubuntu/pool/main/i/icu/libicu52_52.1-8ubuntu0.2_amd64.deb
sudo dpkg -i libicu52_52.1-8ubuntu0.2_amd64.deb



# Install VSTS agent
sudo -u $5 mkdir /home/$5/vsts-agent
cd /home/$5/vsts-agent
sudo -u $5 tar xzf /home/$5/downloads/vsts-agent-ubuntu*
# sudo bin/Agent.Listener --unattended --runasservice --replace --acceptteeeula --url $1 --auth PAT --token $2 --pool $3 --agent $4

echo "LANG=en_US.UTF-8" > .Env
echo "JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> .Env
# export JAVA_HOME_6_X64=/usr/lib/jvm/java-6-oracle
echo "JAVA_HOME_6_X64=/usr/lib/jvm/java-6-openjdk-amd64" >> .Env
# export JAVA_HOME_7_X64=/usr/lib/jvm/java-7-oracle
echo "JAVA_HOME_7_X64=/usr/lib/jvm/java-7-openjdk-amd64" >> .Env
# export JAVA_HOME_8_X64=/usr/lib/jvm/java-8-oracle
echo "JAVA_HOME_8_X64=/usr/lib/jvm/java-8-openjdk-amd64" >> .Env

# Remove NODE_ENV=production from service template file
sudo sed -i 's,NODE_ENV=production,,g' ./bin/vsts.agent.service.template

# sudo -u $5 -E sh ./config.sh --unattended --runasservice --replace --acceptteeeula --url $1 --auth PAT --token $2 --pool $3 --agent $4
# source ./config.sh --unattended --runasservice --replace --acceptteeeula --url $1 --auth PAT --token $2 --pool $3 --agent $4

sudo bin/Agent.Listener --configure --unattended --runasservice --replace --acceptteeeula --url $1 --auth PAT --token $2 --pool $3 --agent $4

echo "ALL DONE!" >> /home/$5/install.progress.txt

