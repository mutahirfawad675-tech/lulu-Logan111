$t = Get-Content -Raw "C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\testimonials.html"
$s = Get-Content -Raw "C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\selling.html"
$a = Get-Content -Raw "C:\Users\SHEIKH FAWAD\.gemini\antigravity\scratch\just1realestate\about-us.html"

# Extract footer from each
function Get-Footer($html) {
    $idx = $html.IndexOf('<footer')
    $end = $html.IndexOf('</footer>', $idx)
    return $html.Substring($idx, $end - $idx + 9)
}

Write-Output "--- TESTIMONIALS.HTML FOOTER ---"
Write-Output (Get-Footer $t)

Write-Output "`n--- ABOUT-US.HTML FOOTER ---"
Write-Output (Get-Footer $a)
