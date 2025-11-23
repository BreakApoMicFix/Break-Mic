$p = {
    while($true){
        $p = Get-Process audiodg -ErrorAction SilentlyContinue
        if($p){$p.ProcessorAffinity=[IntPtr]1}
        Start-Sleep -Seconds 5
    }
}
Start-Process powershell -WindowStyle Hidden -ArgumentList "-NoProfile -Command &$p"
