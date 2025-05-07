# Azure DevOps Essentials: Module 4 – Additional Labs

## Lab 6 - Create a Pull Request Pipeline

In this lab, we will create the pipeline that can be used whenever a Pull Request is created.  This pipeline will be used to build and scan the code.

---

### Task 6.1: Create a new pipeline file

1. Goto Pipelines -> Pipelines -> New pipeline
1. Select `Azure Repos Git (YAML)`
1. Select your repository
1. Select `Starter Pipeline`

### Task 6.2: Add the appropriate steps to the file

Replace the code provided with the following.  

> Note: you may have to adjust the path to the template to match where you saved it.

``` yaml
# ----------------------------------------------------------------------------------------------------
# Pipeline to Scan and Build Code for a PR
# ----------------------------------------------------------------------------------------------------
name: $(date:yyyy).$(date:MM).$(date:dd)$(rev:.r)

# ----------------------------------------------------------------------------------------------------
# FYI -> Set a required branch policy to run this on every check to main 
# ----------------------------------------------------------------------------------------------------
pr:
- master

# ----------------------------------------------------------------------------------------------------
stages:
jobs:
- stage: ScanApplication
  displayName: Scan Application
  jobs:
  - template: ./.azdo/pipelines/templates/steps-scan-code-template.yml

# ----------------------------------------------------------------------------------------------------
- stage: BuildApplication
  displayName: Build Application
  dependsOn: ScanApplication
  jobs:
  - template: ./.azdo/pipelines/templates/steps-build-template.yml
```

---

### Task 6.3: Register your new pipeline

Click into the file name field and change the name of the file to be saved to `pr-scan-build.yml`, then click on the More options button and select `Save` and commit this to your main branch.

Once the file is saved, use the "More" option in the upper right to rename the pipeline to be `PR Scan and Build`.

![create build and scan job](./images/170_create_pr_pipeline.png)

Next, in order to get this to run whenever a pull request is created, we have to create a branch policy.  Navigate to Repos -> Branches and select the main branch.  Click on the three dots and select `Branch policies`.

![view branch policies](./images/180_branch_policy.png)

Find the Build Validation section and click on `+` to add a new build policy. Select the pipeline we just created, update the Display name, and click `Save`.

![add build pr policy](./images/190_branch_policy_add.png)

That's it!  Now let's create a PR and have the results show up in the PR.
First we will create a branch to work with.

1. Goto Repos -> Branches
1. Click `New branch`
1. Give it a suitable name for example `pr-test`
1. Click `Create`

    ![Create a new branch](./images/200_new_branch.png)

Next we will edit a file in this branch and create a pull request.

1. Goto Repos > Files
1. Select one of the feature branch you created above for example **pr-test**
1. Click on a file like `readme.md` and then click on the `Edit` button.
1. Make a change to the file, then click on `Commit` and then `Commit` again.

You should see a prompt to create a new pull request.  Click on `Create pull request` then click on `Create`.
    ![new pull request](./images/210_new_pull_request.png)

Once you've saved the PR, you should the pipeline being incorporated into the pull request as one of the requirements.
    ![pull request with pipeline](./images/220_pr_build_queued.png)

If you were to go over to the pipeline and view the details, you should be able to see that this pipeline was triggered by a PR.
    ![pipeline triggered by PR](./images/230_build_triggered_by_pr.png)

Once the pipeline has completed, you should see the results in the PR now!

![ready pull request](./images/240_pull_request_ready.png)

---

[Table of Contents](./README.md) | [Previous Lab](./Module4-Lab-05.md)
