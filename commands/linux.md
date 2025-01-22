# **Linux Commands**

## Display the content of files in a directory

```bash
for file in dir; do echo "Content of $file:"; cat "$file"; echo; done
```

## Global search for files or directories by name

```bash
sudo find / -iname "*term*" 2>/dev/null
```

## Global search using locate (requires database update)

```bash
sudo updatedb && locate term
```
