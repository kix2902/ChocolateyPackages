$ErrorActionPreference = 'Stop'
$packageName  = 'yakyak' 
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url          = 'https://github.com/yakyak/yakyak/releases/download/v1.5.11.5/yakyak-1.5.11.5-win32-x64.zip'
$checksum     = 'c26c916fce875fd03b76454cac093f15f395d9821f7ef9015e03a30f15659356'
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

