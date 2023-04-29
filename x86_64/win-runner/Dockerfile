FROM mcr.microsoft.com/windows/servercore:ltsc2019

ENV RUNNER_VERSION=2.297.0
ENV MINICONDA_VERSION="py37_4.10.3"
ENV GIT_VERSION=2.34.1

USER containeradministrator
RUN NET ACCOUNTS /MaxPWAge:unlimited
RUN NET USER ghrunner /add /expires:never
RUN NET LOCALGROUP Administrators /add ghrunner

COPY vc_redist.x64.exe .
RUN .\vc_redist.x64.exe /install /quiet /norestart

USER ghrunner
SHELL ["powershell"]

WORKDIR C:\\win-runner
ENV CONDA 'C:\Miniconda'

RUN curl.exe -k -o actions-runner-win-x64-$env:RUNNER_VERSION.zip -L https://github.com/actions/runner/releases/download/v$env:RUNNER_VERSION/actions-runner-win-x64-$env:RUNNER_VERSION.zip
#COPY actions-runner-win-x64-2.291.1.zip .
RUN curl.exe -k -o Git-$env:GIT_VERSION-64-bit.exe -L https://github.com/git-for-windows/git/releases/download/v$env:GIT_VERSION.windows.1/Git-$env:GIT_VERSION-64-bit.exe
RUN curl.exe -k -o Miniconda3-$env:MINICONDA_VERSION-Windows-x86_64.exe -L https://repo.anaconda.com/miniconda/Miniconda3-$env:MINICONDA_VERSION-Windows-x86_64.exe

RUN Expand-Archive -Path actions-runner-win-x64-$env:RUNNER_VERSION.zip -DestinationPath C:\win-runner
RUN Start-Process -Wait -NoNewWindow -FilePath ".\Git-$env:GIT_VERSION-64-bit.exe" -ArgumentList '/SP-', '/VERYSILENT', '/NORESTART', '/NOCANCEL', '/CLOSEAPPLICATIONS', '/RESTARTAPPLICATIONS', '/DIR=C:\git'
RUN Start-Process -Wait -NoNewWindow -FilePath ".\Miniconda3-$env:MINICONDA_VERSION-Windows-x86_64.exe" -ArgumentList "/S", "/AddToPath=1", "/D=$env:CONDA"
COPY entrypoint.ps1 .
COPY get_token.py .
ENTRYPOINT "powershell.exe" "-Command '.\entrypoint.ps1'"
