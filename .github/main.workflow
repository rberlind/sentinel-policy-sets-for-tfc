workflow "sentinel" {
  resolves = ["sentinel-test", "sentinel-test-azure", "sentinel-test-gcp", "sentinel-test-vmware"]
  on = "pull_request"
}

action "sentinel-test-aws" {
  uses = "rberlind/sentinel-github-actions/test@master"
  secrets = ["GITHUB_TOKEN"]
  env = {
    STL_ACTION_WORKING_DIR = "./sentinel-policy-sets/aws"
  }
}

action "sentinel-test-azure" {
  uses = "rberlind/sentinel-github-actions/test@master"
  secrets = ["GITHUB_TOKEN"]
  env = {
    STL_ACTION_WORKING_DIR = "./sentinel-policy-sets/azure"
  }
}

action "sentinel-test-gcp" {
  uses = "rberlind/sentinel-github-actions/test@master"
  secrets = ["GITHUB_TOKEN"]
  env = {
    STL_ACTION_WORKING_DIR = "./sentinel-policy-sets/gcp"
  }
}

action "sentinel-test-vmware" {
  uses = "rberlind/sentinel-github-actions/test@master"
  secrets = ["GITHUB_TOKEN"]
  env = {
    STL_ACTION_WORKING_DIR = "./sentinel-policy-sets/vmware"
  }
}
