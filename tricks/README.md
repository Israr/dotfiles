# JSON Schema Introspection

```
curl -s 'https://ip-ranges.amazonaws.com/ip-ranges.json' | jq -r '[path(..)|map(if type=="number" then "[]" else tostring end)|join(".")|split(".[]") | join("[]")]|unique|map("."+.)'
```

summarize json while keeping values intact in the output

```
curl -s 'https://ip-ranges.amazonaws.com/ip-ranges.json' | jq 'walk(if type == "array" then (if length > 0 then [.[0]] else . end) else . end)'
```


# Check External IP

```
curl http://checkip.amazonaws.com
curl http://ipinfo.io/ip

# more detailed output
curl -s http://ipinfo.io/json | jq '.'
```

# Jupyter notebook in one

```
uv run --with jupyter jupyter notebook
```
