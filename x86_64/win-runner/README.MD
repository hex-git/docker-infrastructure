### This image based on servercore:ltsc2019 image, includes:
  - Miniconda py37_4.10.3
  - GH Actions runner
  - Git-for-Windows 2.34.1
  - Microsoft Visual C++ Redistributable 17 (with with some nuances)
<br>
To run this image, you need to have docker desktop installed, switched to windows container mode (It may work with win docker engine, but it untested). Also you need to enable windows features "Hyper-V" and "Windows Containers".

Known issues:
1) You need to download vc_redist: https://aka.ms/vs/17/release/vc_redist.x64.exe and put it in same directory, where dockerfile stored. Somehow, I can't download it while building.
