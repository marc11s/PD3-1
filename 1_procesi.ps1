$procesi = Get-Process | Where-Object { $_.ProcessName -ne "svchost" } |
    Sort-Object WorkingSet64 -Descending |
    Select-Object -First 5

foreach ($p in $procesi) {
    $mb = [math]::Round($p.WorkingSet64 / 1MB, 2)
    Write-Host "$($p.ProcessName): $mb MB"
}

$total = ($procesi | Measure-Object WorkingSet64 -Sum).Sum /1MB
Write-Host "Top 5 procesu total Ram: $([math]::Round($total,2)) MB"