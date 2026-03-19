$docPath = [Environment]::GetFolderPath("MyDocuments")
$source = Join-Path $docPath "Errors.txt"
$date = Get-Date -Format "yyyy-MM-dd"
$archiveName = "Atskaite_$date.zip"
$dest = Join-Path $docPath $archiveName

Compress-Archive -Path $source -DestinationPath $dest -Force

$size = (Get-Item $dest).Length / 1KB
Write-Host "arhivs izveidots: $archiveName, izmers: $([math]::Round($size,2)) KB"