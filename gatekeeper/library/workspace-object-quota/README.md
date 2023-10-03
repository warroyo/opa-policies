# Workspace Object Quota

This Gatekeeper contstraint template allows for setting up workspace level quotas for objects. The workspace is a TMC construct. This policy enabled the ability to set object level quotas (ex. number of service type load balancer) at the workspace level within a cluster. This means that rather than setting a quota per ns, it will aggregate the results from all namespaces that match the workspace name and evaulate policy based on that.


## Usage

See the sample folder for different implementations. The `tmc` folder for each sample holds the TMC specific policy implementation.

### Paramaters

`workspaces` -  an array of workspace names to evaluate the policy against.This will ensure that the quota is only enforced on these workspaces.

`resources` - array of objects to set quotas on

`resources[].quota` - an integer number to limit the workspace's usage to.

`resources[].kind` -  the k8s resource kind to set a  quota on. ex. `Service`

`resources[].group` -  the k8s api group to for the resource kind. ex. `""`

`resources[].apiVersion` - the k8s api version for the reosurce kind. ex. `v1`

`resources[].type` - optional field for the resource type. this is only applicable for certain objects like the `Service` ex. `LoadBalancer`



## Testing

you can use the `gator cli` to test these. see the `suite.yaml` file for the test cases that are defined. 

```bash
gator verify ./
```