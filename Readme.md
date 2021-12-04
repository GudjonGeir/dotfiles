
### install configs
Run `./install.sh`

### vscode extensions
Automatic sync with extension Settings Sync stored in gist https://gist.github.com/GudjonGeir/2008e4a2f33447fe28c6e2fc2845b85b<Paste>

### Xorg keyboard config
Edit `/etc/X11/xorg.conf.d/00-keyboard.conf` and add the following for `caps:escape` remap
```
Section "InputClass"
        Identifier "system-keyboard"
        MatchIsKeyboard "on"
        Option "XkbLayout" "us,is"
        Option "XkbOptions" "caps:escape"
EndSection
```
