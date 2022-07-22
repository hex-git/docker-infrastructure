$env:Path+=';C:\git\bin'
if(-not(Test-path .\registered -PathType leaf))
{
$runner_token = Invoke-Expression "$env:CONDA\python.exe .\get_token.py"
./config.cmd --url https://github.com/hex-git/docker-infrastructure --token $runner_token; New-Item -Name .\registered -ItemType File
}
while($true)
{Start-Process -Wait -NoNewWindow -FilePath "./run.cmd"; Start-Sleep -s 10}
