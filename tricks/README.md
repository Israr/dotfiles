# JSON Schema Introspection

```
curl -s 'https://ip-ranges.amazonaws.com/ip-ranges.json' | jq -r '[path(..)|map(if type=="number" then "[]" else tostring end)|join(".")|split(".[]") | join("[]")]|unique|map("."+.)'
```

summarize json while keeping values intact in the output

```
curl -s 'https://ip-ranges.amazonaws.com/ip-ranges.json' | jq 'walk(if type == "array" then (if length > 0 then [.[0]] else . end) else . end)'
```

