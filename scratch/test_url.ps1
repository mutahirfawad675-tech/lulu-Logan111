[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$urls = @('https://just1realestate.com/featured-listings/', 'https://just1realestate.com/featured-properties/', 'https://just1realestate.com/properties/', 'https://just1realestate.com/featured-listings')
$wc = New-Object System.Net.WebClient
$wc.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36")
foreach ($u in $urls) {
    try {
        $html = $wc.DownloadString($u)
        Write-Output "URL: $u -> Length: $($html.Length)"
        # Search for title or section
        $m = [regex]::Match($html, '<title>([^<]+)</title>')
        if ($m.Success) { Write-Output "Title: $($m.Groups[1].Value)" }
        break
    } catch {
        Write-Output "URL: $u -> Error: $($_.Exception.Message)"
    }
}
