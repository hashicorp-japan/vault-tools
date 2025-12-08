ui = true
listener "tcp" {
  tls_disable = 1
  address = "[::]:8200"
  cluster_address = "[::]:8201"
}

disable_mlock = true

storage "raft" {
  path = "/vault/file"
}