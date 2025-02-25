# **Linux Commands**

## Display the content of files in a directory

```bash
for file in *; do echo "Content of $file:"; cat "$file"; echo; done
```

## Display the content of files in a directory **recursively**

```bash
find . -type f -exec echo "Content of {}:" \; -exec cat {} \; -exec echo \;
```

## Global search for files or directories by name

```bash
sudo find / -iname "*term*" 2>/dev/null
```

## Global search using locate (requires database update)

```bash
sudo updatedb && locate term
```

## Find manually installed packages

```bash
grep "pacman -S " /var/log/pacman.log
```
