# Kubernetes Demos

To run these demos you need `pv`, `tmux`, `vagrant` and a virtualization provider like `libvirt` or Virtual Box installed.
**Note**: I am using `libvirt` as Virtualization provider.

Setting up your environment for these scripts

### Install requirements

```bash
sudo dnf -y install pv tmux vagrant-libvirt
sudo systemctl enable --now libvirtd
```

### Get the latest kubernetes

```bash
wget https://github.com/kubernetes/kubernetes/releases/download/v1.3.3/kubernetes.tar.gz
tar xvzf kubernetes.tar.gz
cd kubernetes/
```

Edit `Vagrantfile` for provider of your choice to have more than one CPU.

### Start the cluster

This cluster has two nodes and a master, each VM will have 2048 MB RAM.
```bash
export KUBERNETES_PROVIDER=vagrant
export KUBERNETES_MEMORY=2048
export NUM_NODES=2

./cluster/kube-up.sh
```

### Getting the downloaded `kubectl`

```bash
mkdir -p ~/.local/bin/
cp ./platforms/linux/amd64/kubectl ~/.local/bin/
```


### Links

- The contrib repo is taken from https://raw.githubusercontent.com/kubernetes/contrib
- Thanks to [Tim Hockin](twitter.com/thockin) and [Vishnu Kannan](twitter.com/thockin) for writing that [`utils.sh`](https://github.com/kubernetes/contrib/blob/master/micro-demos/util.sh) script
- Doc: http://kubernetes.io/docs/getting-started-guides/vagrant/
- Kubernetes Release Page: https://github.com/kubernetes/kubernetes/releases
