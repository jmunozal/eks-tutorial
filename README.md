# eks-tutorial

## Master nodes

## Update configuration

## Worker nodes

## Run configmap

{```
> terraform output config_map_aws_auth > config_map_aws_auth.yaml

> eks-tutorial kepler$ kubectl apply -f config_map_aws_auth.yaml
configmap "aws-auth" created

> kubectl get nodes
NAME                                            STATUS    ROLES     AGE       VERSION
ip-10-0-211-169.eu-central-1.compute.internal   Ready     <none>    1m        v1.12.7
ip-10-0-84-182.eu-central-1.compute.internal    Ready     <none>    2m        v1.12.7
```}

## Test a container

{```
> kubectl run jma-k8s-cluster --image jmunozal/klusty --port 8000 --generator=run/v1
replicationcontroller "jma-k8s-cluster" created
```}