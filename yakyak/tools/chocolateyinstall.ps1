$ErrorActionPreference = 'Stop'
$packageName  = 'yakyak' 
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url          = 'https://github.com/yakyak/yakyak/releases/download/v1.5.11/yakyak-1.5.11-win32-x64.zip'
$checksum     = 'A92321D5C4E66947300E9E46C7033A2230FC80F83781532B0C9B6C061757F938'
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

