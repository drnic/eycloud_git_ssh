# Generate git command with specific identity

By default, `git` uses the local environments `ssh` for its `git@...` remote system access. If you want to override the credentials/identity being used then it requires you to setup a bunch of intermediate files.

This recipe generates a wrapper `git` command that uses an alternate IdentityFile.

## Usage

    ey-recipes clone git://github.com/drnic/eycloud_git_ssh.git git_ssh

## Generated files

Assuming the owner user is 'deploy', the following files are created:

    /home/deploy/bin/git
    /home/deploy/bin/git-ssh
    /home/deploy/config/git-ssh-config

If you set `git_ssh_name` (defaults to "git") to "mygit", the following files are created:

    /home/deploy/bin/mygit
    /home/deploy/bin/mygit-ssh
    /home/deploy/config/mygit-ssh-config
