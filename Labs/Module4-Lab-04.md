# Azure DevOps Essentials: Module 4 – Additional Labs

## Lab 4 - Combine the Build and Scan Jobs

In this lab, you will combine the Build and Scan into one Job.

- Rename the `stage: ScanStage` to be `stage: ScanAndBuildStage`

- Remove the `stage: BuildStage` line and the following `jobs:` line.

Be sure that the indentation is correct.  The `jobs:` line should be indented to the same level as the previous `template:` line.

Your code should look like this:

![Combine Jobs](./images/Combine-Jobs.png)

Run the job again and you can see that now there are two stages instead of three.

---

[Table of Contents](./README.md) | [Next Lab](./Module4-Lab-05.md) | [Previous Lab](./Module4-Lab-03.md)