Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install transgui googlechrome firefox 7zip putty.install keepass git autohotkey vscode potplayer spotify steam epicgameslauncher goggalaxy origin  tidal hwmonitor 
choco install msiafterburner 
choco install openhardwaremonitor

Write-Output "get keepass-plugin-ioprotocolext"
$packageSearch = 'KeePass Password Safe'
$url = 'http://keepass.info/extensions/v2/ioprotocolext/IOProtocolExt-1.16.zip'
try {
    # search registry for location of installed KeePass
    $regPath = Get-ItemProperty -Path @('HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*',
                                        'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*',
                                        'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*') `
                                -ErrorAction:SilentlyContinue `
            | Where-Object {$_.DisplayName -like "$packageSearch*" `
                            -and `
                            $_.DisplayVersion -ge 2.27 `
                            -and `
                            $_.DisplayVersion -lt 3.0 } `
            | ForEach-Object {$_.InstallLocation}
    $installPath = $regPath

    if (! $installPath) {
        Write-Output "$($packageSearch) not found installed."
        $binRoot = Get-BinRoot
        $portPath = Join-Path $binRoot "keepass"
        $installPath = Get-ChildItemDir $portPath* -ErrorAction SilentlyContinue
    }
    if (! $installPath) {
        Write-Output "$($packageSearch) not found in $($env:ChocolateyBinRoot)"
        throw "$($packageSearch) location could not be found."
    }
    $pluginPath = Join-Path $installPath "Plugins"
    
    Write-Output "installPath: $($installPath)"
    Write-Output "url: $($url)"
    Write-Output "pluginPath: $($pluginPath)"
    # create temp with zip extension (or Expand will complain)
    $tmp = New-TemporaryFile | Rename-Item -NewName { $_ -replace 'tmp$', 'zip' } -PassThru
    #download
    Invoke-WebRequest -OutFile $tmp $url
    #exract to same folder 
    $tmp | Expand-Archive -DestinationPath $pluginPath -Force
    # remove temporary file
    $tmp | Remove-Item
} catch {
  throw $_.Exception
}