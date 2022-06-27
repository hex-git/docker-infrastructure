import requests
import json
user = "hex-git"
repo = "REPO"
reg_url = "https://api.github.com/repos/%s/%s/actions/runners/registration-token" % (user, repo)
token = "GH_PAT"
response = requests.post(reg_url, auth=(user, token))
rtoken = response.json()
print(rtoken['token'])
