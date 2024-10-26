## generate key

With no passphrase and comment showing hostname.

```sh
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/ed25519 -C "$HOST" -N ''
```

## add to ~/.ssh/config

```
Host github.com
    User git
    Hostname github.com
    PreferredAuthentications publickey
    IdentitiesOnly yes
    IdentityFile ~/.ssh/ed25519
```

## add github to known hosts when prompted

[GitHub's SSH key fingerprints](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints)

## [test connection](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection)

```sh
ssh -T git@github.com
```

> Hi USERNAME! You've successfully authenticated, but GitHub does not provide shell access.

Add public key to [Github SSH keys](https://github.com/settings/keys)
