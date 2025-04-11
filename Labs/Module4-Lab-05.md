
# Azure DevOps Essentials: Module 4 – Additional Labs

## Lab 5

In this lab, we will change the pipeline to use templates for all of the actions.

---

### Task 1: Add a Name to the Pipeline

You can make the name that is displayed in the Azure DevOps pipeline pages more meaningful by adding a custom name to the pipeline.  This is done by adding a `name` property to the pipeline. This name can include variables like the date or the build number.  Add this line at the top of your pipeline.

``` yaml
name: $(date:yyyy).$(date:MM).$(date:dd)$(rev:.r)
```

---

### Task 2: Add a Scan Parameter

Add another parameter to the pipeline to choose whether to perform the scan or not.

``` yaml
- name: runCodeScan
  displayName: Run Code Scan
  type: boolean
  default: true
```

Add a conditional statement before the scan stage, making sure to indent it correctly.

``` yaml
- ${{ if eq(parameters.runCodeScan, true) }}:
```

---

### Task 3: Create a Build Stage with a template

Replace all of the build stage code with a simple call to a build template.

``` yaml
- stage: BuildStage
  jobs:
  - template: ./templates/steps-build-template.yml
```

---

### Task 4: Create a Deploy Stage with a template and a parameter

Replace all of the deploy code with a template and add a parameter for the student number.  Keep the conditional statement for the deploy stage.

``` yaml
- ${{ if eq(parameters.deployWebApp, true) }}:
  - stage: DeployStage
    jobs:
    - template: ./templates/steps-deploy-template.yml
      parameters:
        appName:  'pul-yaml-$(studentIdNumber)'
```

---

### Task 4: Give it a test

Run the pipeline and verify that it works as expected.

---

[Table of Contents](./README.md) | [Next Lab](./Module4-Lab-06.md) | [Previous Lab](./Module4-Lab-04.md)
