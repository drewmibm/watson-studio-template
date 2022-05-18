# Watson Studio Template
Repository template for Watson Studio projects with instructions to start your work using Watson Studio & Git repositories.  

## Work with Watson Studio and Git Repository
Watson Studio projects rely on 2 folders (`assets/` and `assettypes/`, for example, the environment definitions are stored there and the UI checks these folders to list available environments) as well as a few entries in `.gitignore` to function. Therefore, when creating a Watson Studio project for a Git repository, if the target Git repository does not contain such information, Watson Studio will write those into the branch you specified (for `.gitignore`, it will add entries if there is an existing one). 

**Note**:

- When creating a Watson Studio project with Git repository, make sure you use the **"default"** type of Git integration. Depending on the version of Watson Studio, you may see the following warning. This warning will be removed in a future release. Nothing bad will happen and it can be ignored. The "default" type of Git integration is able to work with a Git repository with existing files.
![project-creation-warning](img/1-project-creation-warning.png)

- Watson Studio as of Cloud Pak for Data (CPD) 4.0.5 uses CPD profile for Git. This means the **commit author information** can be wrong, if the account and information on your Git service does not match your CPD profile (e.g., when using Public GitHub and your account there uses a different email address). If this applies to your case, re-configure git profile and put the correct information (it's only needed once if you have specified `git config --global credential.helper store`):
```
git config --local user.name <your name>
git config --local user.email <your email>
```

### I'm fine with additions
If you are good with these few additions in your repository, you can simply hook up a new Watson Studio project with your Git repository and do your work.

### I don't want additions
If the end goal is to have a Git repository that you can release to a broader team, or even to the public (e.g., DeepLIIF), or to work on a forked repo, then you might want to keep this **release repo** as clean as possible, and the presence of Watson-Studio-specific folders may not be preferred.
- For this purpose, it's recommended to have 2 Git repositories:
  - **release repo**, the clean Git repository only containing the files you want to release
  - **Watson Studio repo**, a Git repository used to function as the workspace for a Watson Studio project and allows interaction with the release repo by referring to the release repo as a Git **submodule**

#### Steps to create and configure a Watson Studio project
1. Create a new Watson Studio project and configure it with the **Watson Studio repo** (once it finishes, you shall see Watson-Studio-specific folders and entries added to the Git repo)
2. Open JupyterLab or Rstudio, the IDE you'd like to use
3. In terminal, create a submodule pointing to the **release repo** and fetch the latest content:
```
git submodule add <git link to the release repo>
git submodule update
```
  - Now, for all the file changes outside of this submodule folder, git commands know they are for the **Watson Studio repo**; for all the file changes inside this submodule folder, git will be able to locate the remote and/or upstream properly and push changes to the **release repo**.
4. Add, commit, and push this submodule to **Watson Studio repo**. A submodule in git is a reference, so the content in the **release repo** will not be duplicated in the **Watson Studio repo**.

#### Steps to use a Watson Studio project (the project has already been created)
1. Configure Git authorization (only needed for the first time). Submodules do not inherit the authorization config specified by Watson Studio, so you need to configure it manually. It is the same as how you do it on your laptop. For example, you can run the following command to instruct git to remember the credentials you use:
```
git config --global credential.helper store
```
2. Initialize the submodule to pull content (only needed for the first time, if you received this submodule by pulling from remote repo). You may be asked for username and password (token), but once you have done it, git should keep the credentials and re-use it for future actions.
```
git submodule init
git submodule update
```
