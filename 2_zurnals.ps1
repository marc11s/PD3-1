$days = 7
$startTime = (Get-Date).AddDays(-$days)
$errors = Get-WinEvent -LogName System -ErrorAction SilentlyContinue |
    Where-Object { $_.LevelDisplayName -eq "Error" -and $_.TimeCreated -ge $startTime }

$docPath = [Environment]::GetFolderPath("MyDocuments")
$outputFile = Join-Path $docPath "Errors.txt"

if ($errors.Count -gt 10) {
    $header = "[KRITISKI] Sistema ir nestabila!"
} else {
    $header = "[OK] kludu limenis normals"
}

$lines = @($header, "")
foreach ($e in $errors) {
    $lines += "$($e.TimeCreated) - $($e.Message)"

}

$lines | Out-File -FilePath $outputFile -Encoding UTF8
Write-Host "Kopa kludas: $($errors.Count). Fails saglabats"
