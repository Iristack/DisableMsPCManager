try {
    $service = Get-Service -DisplayName 'Microsoft PC Manager Service' -ErrorAction Stop
    $serviceName = $service.Name

    Write-Host "Find Service: $serviceName" -ForegroundColor Green

    Stop-Service -Name $serviceName -Force -ErrorAction Stop
    Set-Service -Name $serviceName -StartupType Disabled -ErrorAction Stop
    
    Write-Host "Stop and disable 'Microsoft PC Manager Service' success. Exit any key..." -ForegroundColor Yellow
    Read-Host
}catch {
    Write-Host "Not found or Cannot disable/close 'Microsoft PC Manager' Service, Skip" -ForegroundColor Red
    Write-Host "Please check if you are running as an administrator. " -ForegroundColor Red
    Write-Host "Exit any key..." -ForegroundColor Red
    Read-Host
}
