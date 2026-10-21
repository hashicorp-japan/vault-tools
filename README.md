# vault-tools
This repo is intended for lab use to test Vault DR and PR replications.

## Use Makefile to set up Vault Clusters
Please see help
```
$ make
Usage: make [target]

Targets:
up                   Spin-up Vault clusters
init                 Initialize Vault cluster
unseal               Unseal Vault cluster
establish-pr         Establish Vault PR Replication
establish-dr         Establish Vault DR Replication
down                 Clean up environment
help                 Print this help
```

# Manual procedure
## Bring up containers
This will bring up containers without replication setup.
```shell
% git clone git@github.com:hashicorp-japan/vault-tools.git
% cd vault-clusters/

# start
% export VAULT_LICENSE=$(cat ${path_to_your_license_file})
% make up

# cleanup
% make down
```

## Export env
```
export PRI_ADDR="http://127.0.0.1:8200"
export PERF_ADDR="http://127.0.0.1:8210"
export DR_ADDR="http://127.0.0.1:8220"
export PRI_CL_ADDR="http://vault-enterprise-cluster-pri:8201"
```


# Permission
```
$ docker run --rm --entrypoint sh hashicorp/vault-enterprise:latest -c 'id vault'
uid=100(vault) gid=1000(vault) groups=1000(vault),1000(vault)

$ docker inspect cluster-pri-nd-1 \
  --format '{{range .Mounts}}{{println .Source "->" .Destination}}{{end}}'
/home/ubuntu/sandbox/vault-tools/cluster-pri/data_1 -> /vault/file
/var/lib/docker/volumes/cdfd4eae6c4066218a77171498b335b86a57f5b0559ad22d49aa5869085932c7/_data -> /vault/logs
/home/ubuntu/sandbox/vault-tools/cluster-pri/config/vault_1.hcl -> /vault/config/vault-server.hcl

$ sudo chown -R 100:1000 \
  cluster-pri/data_*

$ sudo chmod 750 \
  cluster-pri/data_*
```