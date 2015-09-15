#Get-ChildItem -Path D:\IIS -Filter test.txt -Recurse | % {$_.fullname} | Measure-Object
#cat .\test.txt | % {if (-Not (Test-Path($_))) { New-Item $_ -type file }}
param(
    [string]$env
)


#$env = "test"
$fileName = "test.txt"
$counter = 0
$readyFiles = @( 
                "D:\IIS\WebUI-$env\", `
                "D:\IIS\WebAPI-$env\", `
                "D:\IIS\WebAdmin-$env\"
)


ForEach ($folder in $readyFiles) 
{
    $file = $folder + $filename
 
    if (-Not (Test-Path ($file) ) -and (Test-Path ($folder) )) {
        write-host "$file created"
        $counter = $counter + 1
        New-Item $file -type file
    }
#
}

invoke-command {iisreset}

write-host "$counter file created."
