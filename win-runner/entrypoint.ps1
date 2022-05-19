$env:Path+=';C:\git\bin'
if(-not(Test-path .\registered -PathType leaf))
{./config.cmd --url https://github.com/hex-git/$env:$REPO --token $env:GH_TOKEN; New-Item -Name .\registered -ItemType File}
while($true)
{Start-Process -Wait -NoNewWindow -FilePath "./run.cmd"; Start-Sleep -s 10}
