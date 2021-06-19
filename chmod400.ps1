if($args.Count -ne 0){
    $key = $args[0]
}else{
    $key = Read-Host -Prompt "Please enter the key location"
}

icacls.exe $key /reset

icacls.exe $key /grant:r "$($env:username):(r)"

icacls.exe $key /inheritance:r

Write-Host "Press any key to continue..."
Read-Host

