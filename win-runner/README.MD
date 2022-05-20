### This image based on servercore:20H2 image, includes:
  - Miniconda py37_4.10.3
  - GH Actions runner 2.291.1 (last at 19.05.2021)
  - Git-for-Windows 2.34.1
  - Microsoft Visual C++ Redistributable 17 (with with some nuances)

Known issues:
1) You need to download vc_redist: https://aka.ms/vs/17/release/vc_redist.x64.exe and put it in same directory, where dockerfile stored. Somehow, I can't download it while building.
2) https://github.com/hex-git/docker-infrastructure/blob/add_docs/win-runner/Dockerfile#L20 - somehow, it downloads bad archive and can't expand it. As fastfix - download runner manually (https://github.com/actions/runner/releases/download/v2.291.1/actions-runner-win-x64-2.291.1.zip) and put it where dockerfile stored

### How to build and run image (examples use this repo)
0) Get runner token from settings of your repo;
0.5) To run this image, you need to have docker desktop installed, switched to windows container mode (It may work with win docker engine, but it untested). Also you need to enable windows features "Hyper-V" and "Windows Containers".<br>
Run in powershell:
1) _docker build /directory/where/dockerfile/stored/_
2) _docker run -d --env REPO=docker-infrastructure --env GH_TOKEN=token_from_step_0 $YOUR_IMAGE_ID_
