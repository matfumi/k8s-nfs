# k8s-nfs  
A cutting-edge Alpine-based image replacing the outdated `gcr.io/google_containers/volume-nfs` (CentOS & Docker schema 1). The original image isn’t compatible with `containerd 2.0`—set to be the standard runtime in `GKE 1.33`.  

Boost your NFS server deployment with an extra environment variable to support dynamic exports beyond just `/exports`.  

## Deployment Updates  
Since exports aren’t hardcoded anymore, add these environment variables to your deployment:  

```yaml
env:
- name: EXPORTS
  value: "/exports *(rw,fsid=0,sync,no_subtree_check,no_root_squash)"
```

## Kubernetes YAML Example  
Check out `nfs-server-deploy.yaml` for a complete deployment example.  

## Port Configuration Tips  
Make sure your container ports are set up correctly:  

```yaml
ports:
- containerPort: 2049
- containerPort: 20048
- containerPort: 111
  protocol: UDP
- containerPort: 111
  protocol: TCP
```  

Happy coding and seamless deployments!
