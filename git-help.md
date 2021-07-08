# Remember that not all branches have to remain complacent with each other. `breaking` might have the most commits, `dev` will have the bleeding edge, but relatively stable commits. `main` will have older code, which will be rebased on a specified schedule.

# pushing to a private git repo.

## initialise git repo.
```
git init
```
If you're on Windows, and if you want git to set `main` as the default branch for every repo from now on, run:

```
git config --global init.defaultBranch main
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

## watching differences in commits between branches

This will show you commits that branch-2 has but branch-1 doesn't.

```
git log <branch-1>..<branch-2> --oneline --no-merges
```
Of course, it depends on which branch you're checked out to.

>If you want to see which files are actually modified use

```
git diff --stat origin/master..origin/develop --no-merges
```
<<<<<<< HEAD
I understand that it's getting a bit messy with the names, but you get the point. To compare the branches, put in the *appropriate* branches instead of what's in the sample commands. 
=======
I understand that it's getting a bit messy with the names, but you get the point. To compare the branches, put in the *appropriate* branches instead of what's in the sample commands.
>>>>>>> main

>In case you want to compare it with current branch. It is more convenient to use HEAD instead of branch name like use:

```
git log origin/master..HEAD --oneline --no-merges
```
>I'd suggest the following to see the difference "in commits". For symmetric difference, repeat the command with inverted args:

```
git cherry -v master [your branch, or HEAD as default]
```
<<<<<<< HEAD
>Is this different from git master..branch-X? 
=======
>Is this different from git master..branch-X?
>>>>>>> main

>Sure, "git cherry" is smart: it translates from "commits" into "patches/diffs" and can avoid reporting a "patch" which is on both branches but applied in different order

>This works especially well with patch-based workflows where commits are often cherry-picked and applied to other branches.

Refer to [this](https://stackoverflow.com/questions/13965391/how-do-i-see-the-commit-differences-between-branches-in-git) link.

## merging specific commits between branches

Let's say you need to only merge a single commit, from `breaking` to `dev`. Here are the steps,

- Pull down the branch locally. Use your git GUI or pull it down on the command line, whatever you'd like.
<<<<<<< HEAD
- Get back into the branch you're merging *into*. You'll likely do this by running 
=======
- Get back into the branch you're merging *into*. You'll likely do this by running
>>>>>>> main
    ```
    git checkout dev
    ```
- Find the commits you want to pull into your branch. Go run either the `git log -- pretty` or visit the GitHub UI and grab the unique commit hashes for each of the commits that you want.
<<<<<<< HEAD
- "Cherry pick" the commits you want into this branch. Run this command: 
=======
- "Cherry pick" the commits you want into this branch. Run this command:
>>>>>>> main
    ```
    git cherry-pick <super-long-hash-here>
    ```
    That will pull just this commit into your current branch.

Refer to [this](https://mattstauffer.com/blog/how-to-merge-only-specific-commits-from-a-pull-request/) link.

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

## How to change a Git commit message after a push

Link: https://www.educative.io/edpresso/how-to-change-a-git-commit-message-after-a-push

>## If the message to be changed is for the latest commit to the repository, then the following commands are to be executed:
>
>```
>git commit --amend -m "New message"
>```
>
>```
>git push --force repository-name branch-name
>```
>
>A safer alternative is to use:
>```
>git push --force-with-lease repository-name branch-name
>```
>
>## If the message needs to be amended for an older commit, then the *interactive rebase tool* can be used:
>1. Navigate to the repository that contains the commit you want to amend and open a terminal window.
>2. Use the `git rebase -i HEAD~n` command to display a list of the last `n` commits in your default text editor. For example, the following command would display a list of the last three commits in your current branch:
>```
<<<<<<< HEAD
>git rebase -i HEAD~3 
=======
>git rebase -i HEAD~3
>>>>>>> main
>```
>3. Replace `pick` with `reword` before each commit message that needs to be changed.
>4. Save and close the commit list file.

Now, it will open up another file, which will the message you push for the edits in the commit messages.
Simply write something like `Corrected the commit <copy the commit from ``git log`` or the GitHub GUI>, and pushing changes`.

Save and close that file.

Finally, perform a `git pull origin <branch>` (generally `breaking`).
Finally, `git push -u origin <branch>` - again, generally `breaking`.

When you're done with this, it will take the commit message you just entered (or if it opens an editor, put in a commit message now), and save that. It will merge the changes in the branch.
