#!/bin/sh

# Install Build Tools
sudo /bin/date +%H:%M:%S > /home/$5/install.progress.txt
echo "Installing build-essential package" >> /home/$5/install.progress.txt
sudo apt-get -y install build-essential
sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Done." >> /home/$5/install.progress.txt

sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Installing packaging-dev package" >> /home/$5/install.progress.txt
sudo apt-get -y install packaging-dev
sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Done." >> /home/$5/install.progress.txt


# Install Java

sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Installing openjdk-7-jdk package" >> /home/$5/install.progress.txt


sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get -y update
sudo apt-get install -y openjdk-7-jdk
sudo apt-get -y update --fix-missing
sudo apt-get install -y openjdk-7-jdk
sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Done." >> /home/$5/install.progress.txt

sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Installing openjdk-8-jdk package" >> /home/$5/install.progress.txt

sudo add-apt-repository -y ppa:openjdk-r/ppa
sudo apt-get -y update
sudo apt-get install -y openjdk-8-jdk
sudo apt-get -y update --fix-missing
sudo apt-get install -y openjdk-8-jdk

sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Done." >> /home/$5/install.progress.txt

# Install Oracle Java in silent mode
# echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
# echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

# sudo add-apt-repository -y ppa:webupd8team/java
# sudo apt-get -y update
# sudo apt-get install -y oracle-java7-installer

# sudo add-apt-repository -y ppa:webupd8team/java
# sudo apt-get -y update
# sudo apt-get install -y oracle-java8-installer



# Install Java build tools
sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Installing ant package" >> /home/$5/install.progress.txt
sudo apt-get -y install ant
sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Done." >> /home/$5/install.progress.txt

sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Installing maven package" >> /home/$5/install.progress.txt
sudo apt-get -y install maven
sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Done." >> /home/$5/install.progress.txt

sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Installing gradle package" >> /home/$5/install.progress.txt
sudo apt-get -y install gradle
sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Done." >> /home/$5/install.progress.txt

# Install NodeJS, npm, and gulp

sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Installing NodeJS package" >> /home/$5/install.progress.txt
sudo curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Done." >> /home/$5/install.progress.txt

sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Installing gulp package" >> /home/$5/install.progress.txt
sudo npm install -g gulp
sudo -u $5 npm install gulp --save-dev
sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Done." >> /home/$5/install.progress.txt


# Install VSTS build agent dependencies

sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Installing libunwind8 and libcurl3 package" >> /home/$5/install.progress.txt
sudo apt-get -y install libunwind8 libcurl3
sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Done." >> /home/$5/install.progress.txt


# Download VSTS build agent and required security patch

sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "Installing VSTS Build agent package" >> /home/$5/install.progress.txt

sudo -u $5 mkdir /home/$5/downloads
cd /home/$5/downloads

sudo -u $5 wget https://github.com/Microsoft/vsts-agent/releases/download/v2.101.1/vsts-agent-ubuntu.14.04-x64-2.101.1.tar.gz
sudo -u $5 wget http://security.ubuntu.com/ubuntu/pool/main/i/icu/libicu52_52.1-8ubuntu0.2_amd64.deb
sudo dpkg -i libicu52_52.1-8ubuntu0.2_amd64.deb


# Download Team needed libraries
# sudo -u $5 wget https://xplatalm.blob.core.windows.net/buildlibs/git4idea.zip
# sudo -u $5 wget https://xplatalm.blob.core.windows.net/buildlibs/eclipse.egit.repository-2.1.0.201209190230-r.zip
# sudo -u $5 wget https://xplatalm.blob.core.windows.net/buildlibs/eclipse-SDK-3.5.2-linux-gtk-x86_64.tar.gz
# sudo -u $5 wget https://xplatalm.blob.core.windows.net/buildlibs/ideaIC-14.1.4.zip
# sudo -u $5 wget https://xplatalm.blob.core.windows.net/buildlibs/ideaIC-15.0.6.tar.gz
# sudo -u $5 wget https://xplatalm.blob.core.windows.net/buildlibs/ideaIC-2016.1.2b.tar.gz

# Configure Team gradle properties
# touch /home/$5/.gradle/gradle.properties
# echo "ideaSdk=/home/"$5"/lib/idea/lib" >> /home/$5/.gradle/gradle.properties
# echo "git4idea=/home/"$5"/lib/idea/plugins/git4idea/lib" >> /home/$5/.gradle/gradle.properties


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
./config.sh --unattended --runasservice --replace --acceptteeeula --url $1 --auth PAT --token $2 --pool $3 --agent $4

# sudo bin/Agent.Listener --configure --unattended --runasservice --replace --acceptteeeula --url $1 --auth PAT --token $2 --pool $3 --agent $4

sudo /bin/date +%H:%M:%S >> /home/$5/install.progress.txt
echo "ALL DONE!" >> /home/$5/install.progress.txt

sudo chown -R $5.$5 .*
