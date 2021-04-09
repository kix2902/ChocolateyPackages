$ErrorActionPreference = 'Stop'
$packageName  = 'yakyak' 
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url          = 'https://github.com/yakyak/yakyak/releases/download/v1.5.11.1/yakyak-1.5.11.1-win32-x64.zip'
$checksum     = 'B8EA747F2B1EFCAF6A51B225E3833E06923E163B071E7C83F482DBFB07B5605B'
$ShortcutName = 'YakYak.lnk'
$unzipDir     = 'YakYak-win32-x64'
$exe          = 'YakYak.exe'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'ZIP' 
  url           = $url
  checksum      = $checksum
  checksumType  = 'sha256'    
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -shortcutFilePath "$ENV:Public\Desktop\$ShortcutName" -targetPath "$toolsDir\$unzipDir\$exe" -WorkingDirectory "$toolsDir\$unzipDir"
Install-ChocolateyShortcut -shortcutFilePath "$ENV:ProgramData\Microsoft\Windows\Start Menu\Programs\$ShortcutName" -targetPath "$toolsDir\$unzipDir\$exe" -WorkingDirectory "$toolsDir\$unzipDir"

