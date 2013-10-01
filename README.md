SVG to JPG conversion for Inkscape
==================================

This plugin adds the JPG file type to Inkscape's "Save as..." dialog.

This is an early release, if you find any bugs, please let me know.

Usage
-----

Copy `svg2jpg.sh` and `svg2jpg.inx` to Inkscape's system-wide extension directory `/usr/share/inkscape/extensions/`, or to a user extension directory `$HOME/.config/inkscape/extensions/`.

System-wide installation

    cp svg2jpg.* /usr/share/inkscape/extensions/

Or installation for current user

    mkdir -p ~/.config/inkscape/extensions
    cp svg2jpg.* ~/.config/inkscape/extensions

TODO
----

- Check for Imagemagick's convert ` executable.
