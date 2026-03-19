$pref = Get-MpPreference
$status = Get-MpComputerStatus

$realtime = $pref.DisableRealtimeMonitoring -eq $false
$lastscan = $status.QuickScanAge

if (-not $realtime -or $lastscan -gt 3) {
   Write-Host "Sistema ir apdraudeta" -ForegroundColor Red
} else {
    Write-Host "sistema ir drosa" -ForegroundColor Green
}