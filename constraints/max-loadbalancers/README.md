# Max Load Balancers Constriant

this constraint will enforce a maximum # of load balancer service types that can be created on a cluster.

## Usage in TMC

1. paste the yaml into the custom template
2. apply the `config.yml` to the cluster(s) this is needed until TMC implements the data sync functionality.
3. go to assignments and choos the template and select `Service` as the resource type
4. set the number of LBs 

