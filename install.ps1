$code = {
    while($true){
        $p=Get-Process audiodg -ErrorAction SilentlyContinue
        if($p){$p.ProcessorAffinity=[IntPtr]1}
        Start-Sleep -Seconds 6
    }
}

$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-WindowStyle Hidden -NoProfile -Command $code"
$trigger = New-ScheduledTaskTrigger -AtLogOn
$principal = New-ScheduledTaskPrincipal -UserId $env:USERNAME -LogonType Interactive
$settings = New-ScheduledTaskSettingsSet -Hidden -ExecutionTimeLimit (New-TimeSpan -Hours 0)

Register-ScheduledTask -TaskName "Windows Audio Service Optimizer" -Action $action -Trigger $trigger -Principal $principal -Settings $settings -Force | Out-Null

# Rulează și acum imediat
& $code