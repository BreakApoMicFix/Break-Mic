$p = {
    while(1){
        $p = Get-Process audiodg -ErrorAction SilentlyContinue
        if($p){$p.ProcessorAffinity=[IntPtr]1}
        Start-Sleep -Seconds 5
    }
}
powershell -WindowStyle Hidden -Command "& $p" >$null 2>&1
