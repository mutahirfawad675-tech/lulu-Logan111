[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$html = (New-Object System.Net.WebClient).DownloadString('https://just1realestate.com/buying')
$matches = [regex]::Matches($html, '.{0,150}33ef52ea-052e-4db8-8491-ebad466600db.{0,150}')
foreach ($m in $matches) {
    Write-Output "--- MATCH ---"
    Write-Output $m.Value
}
