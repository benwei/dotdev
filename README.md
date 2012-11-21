My devepment profiles

# how to use

`git clone https://github.com/benwei/dotdev.git`


`cd dotdev; sh link.sh`

Initialize bundle submodule:

```

cd dotdev; sh subinit.sh

```
## tmux
* guide
 - https://wiki.archlinux.org/index.php/Tmux

* test 256 colors support or not?

$ echo -e "My favorite color is \033[38;5;148mYellow-Green\033[39m" # should see yellow green color text, otherwise not support 256 colors.
$ tput colors
256
