---
layout: page
title: sed
permalink: /sed/
resource: true
---
Use `sed` to edit text in files.

## Example

To strip out all characters that start with `0.0.` and afterwards (to the right), then saves the results to `test-f-april-30-clean`:

```
sed 's/0.0.*//' test-f-april-30 > test-f-april-30-clean
```

https://serverfault.com/questions/398187/how-to-delete-all-characters-in-one-line-after-with-sed


## Example

To remove all `|` characters from file:

```
sed 's/[|]//g' f-april-19-clean > test
```

https://unix.stackexchange.com/questions/33110/using-sed-to-get-rid-of-characters


## Example

To delete all blank characters:

```
sed '/^$/d;s/[[:blank:]]//g' bak_f-april-19-clean2 > test4
```



