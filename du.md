It stands for Disk Usage. 

Try it with/without the -h (human readable) and -k options. It will count allocation units.

```
$ du -h
8.0K	./.git/refs/heads
4.0K	./.git/refs/tags

$ du -k
8	./.git/refs/heads
4	./.git/refs/tags
```
