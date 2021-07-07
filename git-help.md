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
    However, if you'd like to edit the MERGE_MSG, type 
    ```
    git merge dev --edit
    ```
- push to `main`.
    ```
    git push -u origin main
    ```

Refer [this](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging) link for more info.

# Quirks
- On windows, a browser tab will open up, and you will have to authenticate yourself (username, account password) once. After that, it will work properly.

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

```
git config --global credential.helper 'cache --timeout=<time_in_seconds>'
```

Obviously, add the `--global` parameter if you want to cache credentials globally.

If you want to remove cached credentials from git,

```
git config --unset credential.helper
```

Add the `--global` flag if you want to remove cached credentials globally.

Also, refer to [this link](https://stackoverflow.com/questions/44246876/how-to-remove-cached-credentials-from-git) and [this link](https://git-scm.com/docs/git-credential-cache) to know more.
Remember that this will not work unless you've put in your username and [PAT](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/creating-a-personal-access-token) (as password) at least once before.

# Problems

## Error: `src refspec master does not match any`

Solution: 

Type the following command to see the `ref`s currently in use.
```
git show-ref
```

If the `ref`s you want are not present here, run `git fetch -u origin`. This will update the `ref`s, at least partially (like, when I ran it, it oulled down the `main` branch and added it as a `ref`, but didn't pull down the `dev` branch).
When a branch you want isn't present, simply run `git checkout -b dev`. Of course, this is assuming that the `dev` branch is already present in the online repo (yes, `dev` already existed before I ran `checkout`).
DO NOT, UNDER ANY CIRCUMSTANCES, CHECKOUT TO A NEW BRANCH. IT'LL WILL MAKE A TERRIBLE MESS OF THE PROJECT. TAKE RESPONSIBILITY FOR THE COMMANDS YOU RUN.

Refer to [this link](https://stackoverflow.com/questions/4181861/message-src-refspec-master-does-not-match-any-when-pushing-commits-in-git), [this link](https://stackoverflow.com/questions/40202284/error-src-refspec-does-not-match-any), and [the documentation](https://git-scm.com/docs/git-push#git-push-ltrefspecgt82308203) for `ref-spec`. These should be enough.
