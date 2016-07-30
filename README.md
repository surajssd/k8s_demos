# k8s_demos

Kubernetes demos

To run these demos you need 'pv' and 'tmux' installed.

Setting up your environment for these scripts


Install requirements

```bash
sudo dnf -y install pv tmux vagrant-libvirt
sudo systemctl enable --now libvirtd
```

Get the latest kubernetes
```
wget https://github.com/kubernetes/kubernetes/releases/download/v1.3.3/kubernetes.tar.gz
tar xvzf kubernetes.tar.gz
cd kubernetes/
```

Edit Vagrantfile for provider of your choice to have more than one CPU

Start the cluster

```bash
export KUBERNETES_PROVIDER=vagrant
export KUBERNETES_MEMORY=2048
export NUM_NODES=2


./cluster/kube-up.sh
```

Getting the downloaded `kubectl`.

```bash
mkdir -p ~/.local/bin/
cp ./platforms/linux/amd64/kubectl ~/.local/bin/
```


### Links

- The contrib repo is taken from https://raw.githubusercontent.com/kubernetes/contrib
- Thanks to Tim Hockin and Vishnu Kannan for writing that `utils.sh` script
