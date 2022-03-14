# SDN-project-firewall-traffic

This is project on SDN, specifically concerning the traffic flows inside and through SDN firewalls.

We will be implementing everything on Mininet. As Mininet is open source, so there shouldn't be problems with regards to questions on infrastructure.

The commands for git, are placed [here](./git-help.md), for the ease of use of the members. Please come online, click on the link, and read through the commands if you have any confusion.

This repository will hold all of our code, configuration, and even thoughts and experiences (if possible) while doing the project. Of course, expecting an ideal outcome is unrealistic. But that's OK. One has to dream for the best, to achieve something close to it.

I sincerely hope that we can make a coherent and a fun project by the end of the official period (6 months approx), and that we will learn from it. Cheers :) 

The structure of the branches is like this:

`breaking` is unstable, and will see frequent changes.
`dev` is downstream to `breaking`, so by design it is more stable, however it will get slightly slower updates.
`main` is the stable branch, it will receive the slowest updates, which will be after we've verified `dev` functions properly.

# Workflow 

*Credits to Harshal for original draft and Arka for mild edits)* :

- Open git bash.
- `cd ..your_path../SDN-project-firewall-traffic`. You will be in the main folder.
- Switch to the branch you're working in, for example if your branch is called `breaking`, switch to the `breaking` branch: `git checkout breaking`
- Pull the branch: `git pull origin breaking`
- Open the project folder in `vscode` (or any suitable editor) and start editing.
- To push the edits in the appropriate branch, first make sure you are in the correct folder by referring to the prompt, then type:
  - `git add filename`
  - `git commit -m "<commit-message>"`.
    - If the author's identity is unknown, then execute:
      - `git config user.email "<your-email-id>"`
      - `git config user.name "<your-git-username>"`
  - `git push -u origin <branch>`
- To read the contents from a certain file either use the command `cat <filename>` or open it directly from `vscode`.
- Executing a file:
  - Open virtual box and start you VM.
  - Checkout the `ip` address of the VM and write it in Putty session and click "open", to establish an SSH session to the VM.
  - Type:
    - `cd` ..your_path../SDN-project-firewall-traffic
    - `git pull origin breaking`. Enter your username and PAT (The PAT is important).
    - `git checkout breaking`
  - Navigate folders with `cd` to reach the file you want to execute.
  - Run the following tests:
    - `sudo mn --custom=filename.py --test=iperf`
    - `sudo mn --custom-filename.py --test=pingall`
- Some commonly used commands:
  - `git log --pretty --oneline`: To see the commits that have been made in the branch this code is executed in a prettier format. One line for each commit.
    - `git log --stat` for a full overview of recent commits.
  - `git checkout <branch>`: To switch to a new branch.
  - `nano filename`: To use nano editor to edit the code in the mentioned file.
  - `sudo mn -c`: Performs clean-up.
