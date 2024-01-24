### Dockerfiles for GH Actions self-hosted runners
Here stored 3 types of runners for 2 cpu-architectures:
1) base-runner - based on ubuntu 20.04 image (available for aarch64 and x86_64), includes:
  - Miniconda py37_4.10.3 (for aarch64 - changed for miniforge, cause miniconda not ready for aarch64)
  - GH Actions runner
  - curl
  - wget
  - git
  - jq
2) no-conda-runner - same as previous, but without Miniconda, and available only for x86_64
3) win-runner - runner for windows containers subsystem, I run it through Docker Desktop on Windows 10 with enabled options Hyper-V, WSL2, Windows containers. x86_64 only.
It based on servercore:ltsc2009 image, includes:
  - Miniconda py37_4.10.3
  - GH Actions runner
  - Git-for-Windows 2.34.1
  - Microsoft Visual C++ Redistributable 17 (with with some nuances)
