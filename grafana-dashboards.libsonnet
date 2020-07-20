local kube = import "../kube-libsonnet/kube.libsonnet";

local Dashboard(namespace, name, dashboard) = kube.ConfigMap('grafana-dashboard-%s' % [name]) {
  metadata+: {
    namespace: namespace,
    labels+: {
      grafana_dashboard: '1'
    },
  },
  data+: {
    [name + '.json']: std.toString(dashboard { uid: name }),
  },
};

local grafana_dashboards_base = {
  namespace:: "default",
  name:: "grafana-dashboard",
  "bob_and_alice": Dashboard($.namespace, 'bob-and-alice', import "dashboards/bob-and-alice.json"),
};

kube.List() { items_+: grafana_dashboards_base }
