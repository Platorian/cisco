If you know the organisations name you can try this tool.
```
theHarvester --help
```

Scan domain or organisation name. You may need to use 'googles' name because of a typo. 
```
theHarvester -d <Target> -b google
```

Multiple sources.
```
theHarvester -d <Target> -b google,linkdin,bing,twitter
```

Sublist3r.
```
theHarvester -d <Target> -b google,twitter,sublist3r
```

Limit reports
```
theHarvester -d <Target> -l 200 -b google,linkdin,twitter
```

