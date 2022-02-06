# fv_utf8
[Free Vision](https://wiki.freepascal.org/Free_Vision) UTF-8 adoption

An attempt to adopt Free Vision TUI library from [Free Pascal](https://www.freepascal.org/) from using 1-byte character encodings to UTF-8 on Linux. Current state: test app builds, runs and is able to show its interface properly. All controls of demo app are working (except ASCII table and text editor - it needs some improvements, but is already able to display utf-8 encoded text opened from file).

```
fpc testapp.pas
```

License: Free Pascal's one (LGPL-with-exception).

Some [notes](http://www.freepascal.ru/forum/viewtopic.php?p=163609#p163609) on adoption process (in Russian).

See also: C++ Turbo Vision UTF-8 [adoption](https://github.com/magiblot/tvision).
