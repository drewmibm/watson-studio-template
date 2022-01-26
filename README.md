# watson-studio-template
Blank repository template for Watson Studio, which can be used to contain one or multiple submodule repos.  

## Motivation
Watson Studio requires multiple directories to be saved to a repository, therefore the method described here can be useful for keeping these files out of a main code repository.

## Getting started
1. Use this template to start a new repo that will be used to contain all the Watson Studio files.
    This repo should be hosted on the same git host as the submodule repo(s).
2. Create Watson Studio project with Git integration for the newly created **containing repo**.  The access token must be able to authenticate **both** the containing repo and the submodule repo(s)
3. Launch JupyterLab IDE and open a new terminal session and enter the following commands.
4. ```
    git config --global user.name <your name>
    ```
5. ```
    git config --global user.email <your email>
    ```
6. ```
    git submodule add <containing repo https URL>
    ```
7. ```
    git submodule update
    ```
8. Run the credential helper
    ```
    ./credential_helper.sh
    ```
9. Export your username for the git remote
    ```
    export GIT_USER=<your username>
    ```
### Verify that git submodules work
```
cd <submodule directory>
git push 
```
Git should not prompt for username and password if configured correctly
Make sure that `GIT_USER` env variable is correctly set if any errors are thrown.



