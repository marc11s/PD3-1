$output = winget upgrade 2>&1
$lines = $output | Where-Object { $_ -match "\$" }

$apps = $lines | Where-Object { $_ -notmatch "^[-\\]" -and $_ -notmatch "^Name" -and $_ -notmatch "upgrade"}

$count = ($apps | Where-Object { $_.Trim() -ne ""}).Count

foreach ($line in $apps) {
    if ($line.Trim() -ne "") {
        Write-Host $line
    }
}

Write-Host ""
Write-Host "Sistema ir $count programmas, kuram nepieciesams atjauninajums" -ForegroundColor Yellow