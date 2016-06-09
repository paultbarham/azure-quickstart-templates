# VM-Ubuntu - Team Services Build Agent and Open JDK installation

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fpaultbarham%2Fazure-quickstart-templates%2Fmaster%2Fopenjdk-vstsbuild-ubuntu-vm%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fpaultbarham%2Fazure-quickstart-templates%2Fmaster%2Fopenjdk-vstsbuild-ubuntu-vm%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template allows you to create a Ubuntu VM with OpenJDK and Vistual Studio Team Services Linux Build Agent. Currently custom script file is pulled temporarily from https://raw.githubusercontent.com/paultbarham/azure-quickstart-templates/master/openjdk-vstsbuild-ubuntu-vm/java-vstsbuild-install.sh

Once the VM is successfully provisioned, Team Services build agent installation and initialization can be verified by accessing the the Agent pools tab under the config for the Team Services account.