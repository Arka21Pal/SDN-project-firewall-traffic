##### Linux credential caching doesn't work right now. Will have to find alternatives.

# pushing to a private git repo.

## initialise git repo.
```
git init
```

## tracking changes in file(s)
```
git add <filename>
```
*or*
```
git add .
```
*or*
```
git add -A
```

## making that first commit
```
git commit <optional_filename_specific_commit> -m "commit_message" -m "optional_commit_message_description"
```
Refer to [this](https://stackoverflow.com/questions/7239333/how-do-i-commit-only-some-files) link.

## change branch to `main`
```
git branch -M main
```

## add git remote (the repo essentially)
- Windows
    ```
    git remote add origin https://username@github.com/username/repo-name.git
    ```
    *or*
- Linux
    ```
    git remote add origin https://github.com/username/repo-name.git
    ```

## first push
```
git push -u origin main
```

## changing to the `dev` branch
```
git checkout -b dev
```

If you've already created a branch, 
```
git checkout dev
```

*Note that you need to have at least one commit to be able to change branches. Advised to commit README.md to `main` before `checkout`. Refer to [this](https://stackoverflow.com/questions/66673759/git-branch-m-main) link.*

## merging the branches

- commit while in the `dev` branch.
    ```
    git commit <optional_file> -m "commit_message"
    ```
- push to the `dev` branch.
    ```
    git push -u origin dev
    ```
- checkout to `main` branch.
    ```
    git checkout main
    ```
- run `git merge dev` to merge changes from `dev` to `main`. No need to mess with "pull requests" when you're the owner.
    ```
    git merge dev
    ```
- push to `main`.
    ```
    git push -u origin main
    ```


Refer [this](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging) link for more info.

# Quirks
- In windows, a browser tab will open up, and you will have to authenticate yourself (username, account password) once. After that, it will work properly.
- On Linux, however, as of 2021-07-06, I have not found any alternative other than putting in my username and [PTA](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token) (which need sto be copied somewhere safe, as GitHub only shows it to you once.). It's repetitive, and boring, and annoying. Working on a solution.

You can also [cache your credentials in git](https://docs.github.com/en/get-started/getting-started-with-git/caching-your-github-credentials-in-git), however that didn't work for me on Linux.

# caching credentials in git (archive)

I'm paranoid and believe that the GitHub page might go down someday. Lol.

## windows

```
git config credential.helper wincred
```

If you want to cache credentials for the entire system,

```
git config --global credential.helper wincred
```

## linux

1. In Terminal, enter the following:

```
$ git config --global credential.helper cache
# Set git to use the credential memory cache
```

2. To change the default password cache timeout, enter the following:

```
$ git config --global credential.helper 'cache --timeout=3600'
# Set the cache to timeout after 1 hour (setting is in seconds)
```

Obviously, remove the `--global` parameter if you want to cache credentials only for the specific repository.