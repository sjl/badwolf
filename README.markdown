Bad Wolf
========

A color scheme for Vim, pieced together by [Steve Losh](http://stevelosh.com/).

There's still quite a lot of room for improvement (particularly in HTML) so feel
free to send me ideas through the [issue tracker][] or pull requests.

It's MIT/X11 licensed, so feel free to hack it apart if you like.

**If you're going to send a pull request that you want me to merge, please post
a comment in it with before/after screenshots!**

[issue tracker]: http://github.com/sjl/badwolf/issues

Screenshots
-----------

These screenshots may be out of date, but they'll at least give you a taste of
what you're in for.

### Python

![Screenshot](http://i.imgur.com/fQGGC.png)

### HTML (Django Templates)

![Screenshot](http://i.imgur.com/LgLar.png)

### Clojure

![Screenshot](http://i.imgur.com/THHz7.png)

### Markdown

![Screenshot](http://i.imgur.com/J56VS.png)

Configuration
-------------

There are a few settings you can use to tweak how Bad Wolf looks.

### g:badwolf\_html\_link\_underline

Determines whether text inside `a` tags in HTML files will be underlined.

    " Turn off HTML link underlining
    let g:badwolf_html_link_underline = 0

Default: `1` (on)

Contributing
------------

I'd love pull requests, but won't necessarily merge all of them.  Color schemes
are a very subjective topic -- we don't all have the same taste.

**If you're going to send a pull request that you want me to merge, please post
a comment in it with before/after screenshots!**
