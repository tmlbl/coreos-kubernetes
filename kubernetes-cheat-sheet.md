## To get the status and logs of running services:

### On Master:

````
$ sudo systemctl status apiserver
$ sudo journalctl -r -u apiserver

$ sudo systemctl status controller-manager
$ sudo journalctl -r -u controller-manager

$ sudo systemctl status etcd
$ sudo systemctl status nginx
````

### On Minion:

````
$ sudo systemctl status docker
$ sudo journalctl -r -u docker

$ sudo systemctl status kubelet
$ sudo journalctl -r -u kubelet
`````

## To introspect kubernetes:

````
cluster/kubecfg.sh list /pods
cluster/kubecfg.sh list /services
cluster/kubecfg.sh list /replicationControllers
cluster/kubecfg.sh -p 8080:80 run dockerfile/nginx 3 myNginx

## begin wait for provision to complete, you can monitor the minions by doing
  vagrant ssh minion-1
  sudo docker images
  ## you should see it pulling the dockerfile/nginx image, once the above command returns it
  sudo docker ps
  ## you should see your container running!
  exit
## end wait

## back on the host, introspect kubernetes!
cluster/kubecfg.sh list /pods
cluster/kubecfg.sh list /services
cluster/kubecfg.sh list /replicationControllers
````


