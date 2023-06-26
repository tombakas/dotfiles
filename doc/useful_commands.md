**Redirect traffic from port 80 to 8080**
`iptables -t nat -A OUTPUT -o lo -p tcp --dport 80 -j REDIRECT --to-port 8080`

[Reference](https://askubuntu.com/questions/444729/redirect-port-80-to-8080-and-make-it-work-on-local-machine)

---

**Disable screenshot sound in Gnome**
The proper way to do this is via a custom sound theme that disables the `gnome-screenshot` sound that corresponds to the `screen-capture` event in Gnome.

Create the custom theme directory:
`mkdir -p ~/.local/share/sounds/__custom`

create the  `.disabled`  file:

`touch ~/.local/share/sounds/__custom/screen-capture.disabled`

add the  `index.theme`:
```
cat << 'EOF' > ~/.local/share/sounds/__custom/index.theme
[Sound Theme]
Name=__custom
Inherits=freedesktop
Directories=.
EOF
```

set  `__custom`  as default theme name:

```
gsettings set org.gnome.desktop.sound theme-name '__custom'
```
[Reference](https://unix.stackexchange.com/questions/93368/how-can-i-disable-the-shutter-sound-of-gnome-screenshot)

**Disable screenshot sound in Gnome**

`dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause`


---

**Better control of Gnome notifications**

Use this script: [Notify desktop](https://github.com/nowrep/notify-desktop)

---

**PDF operations**

* **splt**: ``pdfseparate <filename>``
* **rotate**: `pdftk  <input file> cat 1south output <output file>`
* **unite**: `pdfunite <file1> <file2> <output>`
