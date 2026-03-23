$docPath = [Environment]::GetFolderPath("MyDocuments")
$logFile = Join-Path $docPath "Apkope.log"
$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

$disk =Get-PSDrive C
$freeGB =[math]::Round($disk.Free / 1GB, 2)
$totalGB = [math]::Round(($disk.Free + $disk.Used) / 1GB, 2)
$freePercent = [math]::Round(($disk.free / ($disk.Free + $disk.Used)) * 100, 1)

if ($freePercent -lt 25) {
    $tempPath = $env:TEMP
    $beforeTemp = (Get-ChildItem $tempPath -Recurse -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum / 1GB
    Remove-Item "$TempPath\*" -Recurse -Force -ErrorAction SilentlyContinue
    Clear-RecycleBin -Force -ErrorAction SilentlyContinue
    $freed = [math]::Round($beforeTemp, 2)

    Add-Content -Path $logFile -Value "[$date] Tirisana veikta atbrivoti [$freed] GB."
    Write-Host "Tirisana veikta atbrivoti $freed GB. " -ForegroundColor Yellow
} else {
    Add-Content -Path $logFile -Value "[$date] Vieta pietiekama."
    Write-Host "Vieta pietiekama brivi: $freed GB ($freePercent%)."
}