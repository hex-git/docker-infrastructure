## This image based on ubuntu 20.04 image, includes:
  - Miniconda py37_4.10.3
  - GH Actions runner 2.291.1 (last at 19.05.2021)
  - curl
  - wget
  - git
  - jq

### How to build and run image (examples use this repo)
0) Get runner token from settings of your repo;
1) _docker build /directory/where/dockerfile/stored/_
2) _docker run -d --env REPO=docker-infrastructure --env GH_TOKEN=token_from_step_0 $YOUR_IMAGE_ID_
