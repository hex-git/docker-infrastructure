### Dockerfiles for GH Actions self-hosted runners
Here stored 3 types of runners:
1) base-runner - based on ubuntu 20.04 image, includes:
  - Miniconda py37_4.10.3
  - GH Actions runner 2.291.1 (last at 19.05.2021)
  - curl
  - wget
  - git
  - jq
2) no-conda-runner - same as previous, but without Miniconda
3) win-runner - runner for windows containers subsystem, I run it through Docker Desktop on Windows 10 with enabled options Hyper-V, WSL2, Windows containers.
It based on servercore:20H2 image, includes:
  - Miniconda py37_4.10.3
  - GH Actions runner 2.291.1 (last at 19.05.2021)
  - Git-for-Windows 2.34.1
  - Microsoft Visual C++ Redistributable 17 (with with some nuances)
