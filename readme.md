# Keycloak.X Quarkus - Helm Chart

A Helm chart for deploying the latest Quarkus based distrubtion of Keycloak (aka Keycloak.X or version 17+).  
The chart support for external database, ingress, clustering and secret creation and exposes many of the Keycloak configuration variables in a more friendly and discoverable way

## Quick Start

Keycloak.X has been designed to be run from a customized image where `kc.sh build` has been run to tailor the configuration [see the docs](https://www.keycloak.org/server/containers)

However it is possible to deploy the vanilla un-customized Keycloak image

```bash
helm install kc ./keycloak \
 --set extraSecrets.database.password='secret123!' \
 --set keycloak.adminPasswordSecret.name='kc-keycloak-database' \
 --set keycloak.adminPasswordSecret.key='password' \
 --set 'keycloak.args=["start"]'
```

## Chart Configuration Values

[See the chart readme](./keycloak/README.md) for a full list of values that can be set

## Ingress

It's generally expected that a Kubernetes ingress is put in front of Keycloak rather than exposing Keycloak directly, which is why the default proxy mode for the chart is `edge` this disables HTTPS and TLS on Keycloak, so that TLS can be terminated by the ingress.

[See the Keycloack docs](https://www.keycloak.org/server/reverseproxy) and the chart value `keycloak.proxyMode` setting.

The simplest configuration possible would be:

```yaml
ingress:
  enabled: true
  host: keycloak.example.net
```

Should you wish to enable TLS, specify the `secretName` holding the cert (issuing of certs & TLS secrets is deemed outside the scope of this chart), e.g.

```yaml
ingress:
  enabled: true
  host: keycloak.example.net
  tls:
    enabled: true
    secretName: benco-io-cert
```

## Database