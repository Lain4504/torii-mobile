# Replace withOpacity with withValues in all Dart files
Get-ChildItem -Path "lib" -Recurse -Filter "*.dart" | ForEach-Object {
    $filePath = $_.FullName
    $content = Get-Content $filePath -Raw -Encoding UTF8
    
    # Replace .withOpacity(x) with .withValues(alpha: x)
    $updated = $content -replace '\.withOpacity\(([^)]+)\)', '.withValues(alpha: $1)'
    
    if ($content -ne $updated) {
        Set-Content -Path $filePath -Value $updated -NoNewline -Encoding UTF8
        Write-Host "✓ Updated: $($_.Name)"
    }
}

Write-Host "`nDone! All withOpacity calls replaced with withValues."
