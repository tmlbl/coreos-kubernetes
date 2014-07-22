#! /bin/sh

# sudo mkdir -p /opt/bin
# sudo chown core:core /opt/bin

# /usr/bin/wget -N -P /opt/bin http://storage.googleapis.com/kubernetes/apiserver
# /usr/bin/wget -N -P /opt/bin http://storage.googleapis.com/kubernetes/controller-manager
# /usr/bin/wget -N -P /opt/bin http://storage.googleapis.com/kubernetes/kubecfg
# /usr/bin/wget -N -P /opt/bin http://storage.googleapis.com/kubernetes/kubelet
# /usr/bin/wget -N -P /opt/bin http://storage.googleapis.com/kubernetes/proxy

# /usr/bin/chmod +x /opt/bin/apiserver
# /usr/bin/chmod +x /opt/bin/controller-manager
# /usr/bin/chmod +x /opt/bin/kubecfg
# /usr/bin/chmod +x /opt/bin/kubelet
# /usr/bin/chmod +x /opt/bin/proxy

/opt/bin/apiserver \
        --address=127.0.0.1 \
        --port=8080 \
        --etcd_servers=http://127.0.0.1:4001 \
        --machines=127.0.0.1 \
        --logtostderr=true &

/opt/bin/controller-manager \
        --etcd_servers=http://127.0.0.1:4001 \
        --master=127.0.0.1:8080 \
        --logtostderr=true &

/opt/bin/kubelet \
        --address=127.0.0.1 \
        --port=10250 \
        --hostname_override=127.0.0.1 \
        --etcd_servers=http://127.0.0.1:4001 \
        --logtostderr=true &

/opt/bin/proxy \
		--etcd_servers=http://127.0.0.1:4001 
		--logtostderr=true &


echo "Started all kubernetes components"
# sudo mkdir -p /opt/kubernetes/bin 
# sudo chown -R core: /opt/kubernetes
# cd /opt/kubernetes
# wget https://github.com/kelseyhightower/kubernetes-coreos/releases/download/v0.0.1/kubernetes-coreos.tar.gz
# tar -C bin/ -xvf kubernetes-coreos.tar.gz

# git clone https://github.com/kelseyhightower/kubernetes-coreos.git
# sudo cp kubernetes-coreos/units/* /etc/systemd/system/

# sudo systemctl daemon-reload

# # sudo systemctl start etcd

# sudo systemctl start apiserver
# sudo systemctl start controller-manager
# sudo systemctl start kubelet
# sudo systemctl start proxy

