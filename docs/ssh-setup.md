```sh
# generate key
ssh-keygen -o -a 100 -t ed25519 -f ~/.ssh/path/to/key -C "Comment. IE: name@machine"
```

Github stuff
---
```
# add to ~/.ssh/config
Host github.com
    User git
    Hostname github.com
    PreferredAuthentications publickey
    IdentitiesOnly yes
    IdentityFile ~/.ssh/path/to/key.pub
```

```sh
# test connection
# see: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection
ssh -T git@github.com
# Hi USERNAME! You've successfully authenticated, but GitHub does not provide shell access.
```
Add public key to [Github SSH keys](https://github.com/settings/keys)
