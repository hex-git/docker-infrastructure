FROM mcr.microsoft.com/windows/servercore:20H2

ENV RUNNER_VERSION=2.291.1
ENV MINICONDA_VERSION="py37_4.10.3"
ENV GIT_VERSION=2.34.1

USER containeradministrator
RUN NET USER ghrunner /add
RUN NET LOCALGROUP Administrators /add ghrunner

COPY vc_redist.x64.exe .
RUN .\vc_redist.x64.exe /install /quiet /norestart

USER ghrunner
SHELL ["powershell"]

WORKDIR C:\\win-runner
ENV CONDA 'C:\Miniconda'

RUN curl.exe -k -o actions-runner-win-x64-$env:RUNNER_VERSION.zip -L https://github.com/actions/runner/releases/download/v$env:RUNNER_VERSION/actions-runner-win-x64-$RUNNER_VERSION.zip
RUN curl.exe -k -o Git-$env:GIT_VERSION-64-bit.exe -L https://github.com/git-for-windows/git/releases/download/v$env:GIT_VERSION.windows.1/Git-$env:GIT_VERSION-64-bit.exe
RUN curl.exe -k -o Miniconda3-$env:MINICONDA_VERSION-Windows-x86_64.exe -L https://repo.anaconda.com/miniconda/Miniconda3-$env:MINICONDA_VERSION-Windows-x86_64.exe

RUN Expand-Archive -Path actions-runner-win-x64-$env:RUNNER_VERSION.zip -DestinationPath C:\win-runner
RUN Start-Process -Wait -NoNewWindow -FilePath ".\Git-$env:GIT_VERSION-64-bit.exe" -ArgumentList '/SP-', '/VERYSILENT', '/NORESTART', '/NOCANCEL', '/CLOSEAPPLICATIONS', '/RESTARTAPPLICATIONS', '/DIR=C:\git'
RUN Start-Process -Wait -NoNewWindow -FilePath ".\Miniconda3-$env:MINICONDA_VERSION-Windows-x86_64.exe" -ArgumentList "/S", "/AddToPath=1", "/D=$env:CONDA"

CMD $env:Path+=';C:\git\bin'; if(-not(Test-path .\registered -PathType leaf)); {./config.cmd --url https://github.com/hex-git/$env:REPO --token $env:GH_TOKEN; New-Item -Name .\registered -ItemType File}; while($true); {./run.cmd; Start-Sleep -s 10}
