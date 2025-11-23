$p = {
    while($true){
        $proc = Get-Process audiodg -ErrorAction SilentlyContinue
        if($proc){$proc.ProcessorAffinity = [IntPtr]1}
        Start-Sleep -Seconds 5
    }
}
Start-Process powershell -WindowStyle Hidden -ArgumentList "-NoProfile -Command & $p"