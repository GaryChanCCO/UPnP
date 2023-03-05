$Dll = "$($PSScriptRoot)\Interop.NATUPNPLib.dll"

function Add-UPnPMapping {
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory)][Ushort]$ExternalPort,
    [Parameter(Mandatory)][ValidateSet("TCP", "UDP")]$Protocol,
    [Parameter(Mandatory)][Ushort]$InternalPort,
    [Parameter(Mandatory)][string]$InternalClientIp,
    [Parameter(Mandatory)][string]$Description
  )

  Add-Type -Path $Dll
  $nat = New-Object NATUPNPLib.UPnPNATClass
  $nat.StaticPortMappingCollection.Add($Port, $Protocol, $InternalPort, $InternalClientIp, $true, $Description)
}

function Remove-UPnPMapping {
  [CmdletBinding()]
  Param(
    [Parameter(Mandatory)][Ushort]$ExternalPort,
    [Parameter(Mandatory)][ValidateSet("TCP", "UDP")]$Protocol
  )

  Add-Type -Path $Dll
  $nat = New-Object NATUPNPLib.UPnPNATClass
  $nat.StaticPortMappingCollection.Remove($Port, $Protocol)
}

Export-ModuleMember -Function * -Alias *