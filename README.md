# Grafana dashboards

My Grafana dashboard(s).

I use [kubecfg](https://github.com/bitnami/kubecfg) to write the dashboards as
configmaps, but any method works.

Usage:

```sh
# Show what would change
kubecfg diff grafana-dashboards.jsonnet

# Update
kubecfg update grafana-dashboards.jsonnet
```
