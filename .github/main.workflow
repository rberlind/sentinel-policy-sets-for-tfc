workflow "sentinel" {
  resolves = ["sentinel-test"]
  on = "pull_request"
}

action "sentinel-test" {
  uses = "rberlind/sentinel-github-actions/test@master"
  secrets = ["GITHUB_TOKEN"]
  env = {
    STL_ACTION_WORKING_DIR = "."
  }
}
