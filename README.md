# Sentinel Policy Sets For Use With Terraform Cloud
This repository contains Sentinel [policy sets](https://www.terraform.io/docs/cloud/sentinel/manage-policies.html) for use with Terraform Cloud.

There are four policy sets, one each for AWS, Azure, GCP, and VMware. The first three each contain two policies that restrict the size of VMs and require specific tags or labels.  The fourth contains a single policy that restricts the CPU and memory allocated to VMware VMs.

We have also included [Sentinel Simulator](https://docs.hashicorp.com/sentinel/intro/getting-started/install) test cases for each policy that can be used to test them.

Additionally, [GitHub Action](https://help.github.com/en/articles/about-github-actions) are used to automatically run the Sentinel Simulator test cases inside Docker containers whenever a pull request is done against the master branch. There are four GitHub Action workflows, one for each of the four clouds. Each workflow is only triggered if the pull request includes changes in the associated cloud's policies or test cases.
