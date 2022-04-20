# keycloak

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 17.0.0](https://img.shields.io/badge/AppVersion-17.0.0-informational?style=flat-square)

A Helm chart for deploying Keycloak.x (aka Keycloak Quarkus or version 17+). Supports external database, ingress and clustering

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | If you want to assign affinity to the pods |
| extraSecrets | object | `{}` | Use this to have the chart create extra Kubernetes secrets and assign values to them |
| extraVolumeMounts | list | `[]` | VolumeMounts to add the pods |
| extraVolumes | list | `[]` | Volumes to add to the pods |
| fullnameOverride | string | `""` | String to completely override fullname template |
| image.pullPolicy | string | `"Always"` | Image pull policy for the pods |
| image.registry | string | `"quay.io"` | The registry where the custom Keycloak image is stored |
| image.repository | string | `"keycloak/keycloak"` | The name/repository of the custom Keycloak image |
| image.tag | string | `"17.0.0"` | The tag of the custom Keycloak image |
| imagePullSecrets | list | `[]` | If secrets are required to pull the images |
| ingress.annotations | string | `nil` | Additionnal annotations to add to the ingress |
| ingress.className | string | `""` | The IngressClass to use |
| ingress.enabled | bool | `false` | Enable or disable ingress, a single rule will be created for the service |
| ingress.host | string | `"keycloak.example.net"` | Hostname to use for the ingress rule |
| ingress.path | string | `"/"` | The path to use for the ingress rule |
| ingress.pathType | string | `"Prefix"` | The path type, leave as 'Prefix' if unsure |
| ingress.tls.enabled | bool | `false` | Enable TLS for the ingress |
| ingress.tls.secretName | string | `""` | The secret containing the TLS certificate |
| keycloak.adminPasswordSecret | object | `{"key":"","name":""}` | Secret containing the password for the primary admin user |
| keycloak.adminUser | string | `"admin"` | The name of the primary admin user added to Keycloak at first startup |
| keycloak.args | list | `[]` | The arguments passed to the entrypoint in the Keycloak container (normally this will be kc.sh) |
| keycloak.clustered | bool | `true` | Enable this if the Keycloak image has clustering enabled, needs to be true even if number of replicas is 1 |
| keycloak.database.databaseName | string | `""` | External database: DB name |
| keycloak.database.host | string | `""` | External database: hostname of the database |
| keycloak.database.passwordSecret | object | `{"key":"","name":""}` | External database: reference to the secret containing the DB password |
| keycloak.database.properties | string | `""` | External database: extra properties to add to the JDBC URL |
| keycloak.database.username | string | `""` | External database: DB username |
| keycloak.extraEnv | string | `nil` | Extra environment variables to set in the pod |
| keycloak.extraEnvSecret | string | `nil` | Extra environment variables to set from secrets |
| keycloak.healthCheckPath | string | `"/realms/master"` | The URL path used by readiness checks |
| keycloak.hostnamePath | string | `""` | This should be set if proxy uses a different context path for Keycloak |
| keycloak.hostnameStrict | bool | `false` | Enable or disable strict checking of the host |
| keycloak.hostnameStrictHttps | bool | `false` | Enable or disable strict checking of the TLS certificate |
| keycloak.httpEnabled | bool | `true` | Enable or disable HTTP |
| keycloak.httpPort | int | `8080` | The port used for HTTP access |
| keycloak.javaOptsAppend | string | `""` | Append settings to the startup via JAVA_OPTS_APPEND |
| keycloak.logLevel | string | `"INFO"` | Set logging level for Keycloak |
| keycloak.proxyMode | string | `"edge"` | The proxy forwarding mode |
| nameOverride | string | `""` | String to partially override fullname template (will maintain the release name) |
| nodeSelector | object | `{}` | If you want to use a nodeSelector for the pods |
| podAnnotations | object | `{}` | Annotations to add to the pods |
| podLabels | object | `{}` | Labels to add to the pods |
| replicaCount | int | `1` | Only enable multiple replicas if the image has a cluster provider enabled, and set keycloak.clustered=true |
| resources | object | `{"limits":{"cpu":"2000m","memory":"1G"},"requests":{"cpu":"200m","memory":"400Mi"}}` | Resource limits and requests |
| service.port | int | `80` | The port used for HTTP access into the service |
| service.type | string | `"ClusterIP"` | Type of service to create for Keycloak HTTP traffic |
| tolerations | list | `[]` | If you want to assign tolerations to the pods |

