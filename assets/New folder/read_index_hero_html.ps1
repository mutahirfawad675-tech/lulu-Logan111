$index = Get-Content -Raw "C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\index.html"
$idx = $index.IndexOf('<section id="hero">')
if ($idx -ge 0) {
    Write-Output $index.Substring($idx, 350)
}
