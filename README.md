# Toggle-Network-Connections
My malware lab uses FlareVM and REMnux. 

The default network setup is a private subnet with REMnux simulating the Internet, but sometimes I need to connect to the live Internet. I got really tired of manually changing the network connection settings back and forth between these two setups so I scripted it.

## Files
* toggle_network_connections.ps1 - Powershell script to check the current IP. Based on IP will toggle back and forth between either having a static IP with REMnux providing DNS or using DHCP. Set the variables to your static IP info.
* toggle_network_connections.bat - Batch file that kicks off the Powershell. Update the file path to where you stored the .ps1. I personally put it in %programfiles% with a shortcut to the .bat on my desktop.
