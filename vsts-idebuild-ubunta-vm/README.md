# VM-Ubuntu - Team Services IDE Build Agent and Oracle Java JDK installation

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fpaultbarham%2Fazure-quickstart-templates%2Fmaster%2Fvsts-idebuild-ubunta-vm%2Fazuredeploy.json" target="_blank">
    <img src="http://azuredeploy.net/deploybutton.png"/>
</a>
<a href="http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fpaultbarham%2Fazure-quickstart-templates%2Fmaster%2Fvsts-idebuild-ubunta-vm%2Fazuredeploy.json" target="_blank">
    <img src="http://armviz.io/visualizebutton.png"/>
</a>

This template allows you to create a Ubuntu VM with Oracle Java 6, 7, and 8; All dependent libs for building Visual Studio Team Services (VSTS) IDE plug-ins; and the VSTS CoreCLR Linux Build Agent. Currently custom script file is pulled temporarily from https://raw.githubusercontent.com/paultbarham/azure-quickstart-templates/master/vsts-idebuild-ubunta-vm/java-vstsbuild-install.sh

Once the VM is successfully provisioned, Team Services build agent installation and initialization can be verified by accessing the the Agent pools tab under the config for the Team Services account.
