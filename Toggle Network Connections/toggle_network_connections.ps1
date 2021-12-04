$currentIP = (Get-NetIPAddress -InterfaceAlias Ethernet0 -AddressFamily IPv4).IPAddress.toString()
$analysisIP = "192.168.1.2" #replace with the static ip for your analysis vm
$remnuxIP = "192.168.1.3" #replace with the static ip for your remnux vm
$prefixLen = "24" #replace with your the subnet prefix length
try { $defaultGateway = (Get-NetIPConfiguration -InterfaceAlias Ethernet0).IPv4DefaultGateway.NextHop.toString() } catch { $defaultGateway = "None" }

if ($currentIP -eq $analysisIP){
Set-NetIPInterface -InterfaceAlias Ethernet0 -Dhcp Enabled
Set-DnsClientServerAddress -InterfaceAlias Ethernet0 -ResetServerAddresses
} elseif ($defaultGateway -eq $remnuxIP) {
set-DnsClientServerAddress -InterfaceAlias Ethernet0 -ServerAddresses $remnuxIP
New-NetIPAddress -InterfaceAlias Ethernet0 -IPAddress $analysisIP -PrefixLength $prefixLen -AddressFamily IPv4
} else {
set-DnsClientServerAddress -InterfaceAlias Ethernet0 -ServerAddresses $remnuxIP
New-NetIPAddress -InterfaceAlias Ethernet0 -IPAddress $analysisIP -PrefixLength $prefixLen -AddressFamily IPv4 -DefaultGateway $remnuxIP
}
