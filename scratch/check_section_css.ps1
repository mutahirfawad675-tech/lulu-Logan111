[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$html = (New-Object System.Net.WebClient).DownloadString('https://just1realestate.com/buying')
$matches = [regex]::Matches($html, '#section-bed31784-6f7b-47c1-8380-9945577cb0ea[^{]*\{[^}]*\}')
foreach ($m in $matches) {
    Write-Output $m.Value
}
