# Sentinel Policy Sets For Use With Terraform Cloud
This repository contains Sentinel [policy sets](https://www.terraform.io/docs/cloud/sentinel/manage-policies.html) for use with Terraform Cloud (TFC) and Terraform Enterprise (TFE). It was created for an [SE Hangout](https://www.hashicorp.com/webinars/solution-engineering-hangout-using-sentinel-across-terraform-cloud-organizations) I delivered on September 25, 2019. The slides for that webinar are also in this repository.  I will add a link to the recording of the webinar when it is available.

There are four policy sets, one each for AWS, Azure, GCP, and VMware. The first three each contain two policies that restrict the size of VMs and require specific tags or labels.  The fourth contains a single policy that restricts the CPU and memory allocated to VMware VMs.

I have also included [Sentinel Simulator](https://docs.hashicorp.com/sentinel/intro/getting-started/install) test cases for each policy that can be used to test them.

Additionally, [GitHub Actions](https://help.github.com/en/articles/about-github-actions) are used to automatically run the Sentinel Simulator test cases whenever a pull request is done requesting the merging of changes to the policies into the master branch. There are four GitHub Action workflows, one for each of the four clouds. Each workflow is only triggered if the pull request includes changes in the associated cloud's policies or test cases.

The Terraform code used by the Terraform Cloud workspaces against which the policies are checked is in the GitHub repository, [rberlind/rberlind/se-hangout-9-25-2019](https://github.com/rberlind/se-hangout-9-25-2019).
