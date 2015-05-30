# posh-git-alias
post-git-alias provides Git aliases as PowerShell functions for use with [posh-git](https://github.com/dahlbyk/posh-git).

They are the PowerShell counterpart to the [Git aliases I'm using on Linux / OS X](https://github.com/AlexZeitler/dotfiles/blob/master/profiles/cygwin/git/gitshrc).

# Installation / usage

Just clone this repository and source the `posh-git-alias.ps1` in your PowerShell Profile:

```
git clone git@github.com:AlexZeitler/posh-git-alias.git
```

Find your PowerShell Profile:
```
C:\$PROFILE
# resturns:
# C:\Users\AlexZeitler\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1
```

Edit this file:
```
C:\Notepad $PROFILE
```

Add this line at the end of your `Microsoft.PowerShell_profile.ps1` file:
```
. <PATHTOTHEFILE>\posh-git-alias.ps1
```

Re-run PowerShell or reload your Profile:
```
C:\. $PROFILE
```

If you find any bugs, please file an [issue](https://github.com/AlexZeitler/posh-git-alias/issues) or send me a [PR](https://github.com/AlexZeitler/posh-git-alias/pulls).
