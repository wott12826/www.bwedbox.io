# Read the file content
$content = Get-Content 'index.htm' -Raw

# Add CSS to make iframes fill their entire parent blocks 
$fullBlockCSS = @'
<style>
/* Make iframe fill entire parent block */
#comp-m3t3guqi {
    height: 100vh;
    width: 100%;
    display: flex;
    align-items: stretch;
}

#comp-m3t3guqi iframe {
    flex: 1;
    width: 100% !important;
    height: 100% !important;
    border: none !important;
    min-height: unset !important;
}

#comp-m29cgb9k {
    height: 100vh;
    width: 100%;
    display: flex;
    align-items: stretch;
}

#comp-m29cgb9k iframe {
    flex: 1;
    width: 100% !important;
    height: 100% !important;
    border: none !important;
    min-height: unset !important;
}
</style>
'@

# Insert CSS before closing head tag if exists, otherwise before closing body
if ($content -match '</head>') {
    $content = $content -replace '</head>', ($fullBlockCSS + "`n</head>")
} else {
    $content = $content -replace '</body>', ($fullBlockCSS + "`n</body>")
}

# Write the content back
$content | Set-Content 'index.htm' -NoNewline

Write-Host "CSS added successfully! DexScreener and Flappy BWED will now fill their entire blocks" 