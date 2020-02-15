path "secret/*" {
  capabilities = ["list"]
}

path "secret/development/*" {
  capabilities = ["list", "read"]
}

path "secret/staging/*" {
  capabilities = ["list", "read"]
}

path "secret/production/*" {
  capabilities = ["list", "read"]
}

path "secret/production/arangodb" {
  capabilities = ["read"]
}
