package kubernetes.test_admission   

import data.kubernetes.admission 

services = [{
    "apiVersion": "v1",
    "kind": "Service",
    "metadata": {
        "labels": {
            "component": "apiserver",
            "provider": "kubernetes"
        },
        "name": "lb1",
        "namespace": "default"
    },
    "spec": {
        "clusterIP": "100.64.0.1",
        "ports": [
            {
                "name": "https",
                "port": 443,
                "protocol": "TCP",
                "targetPort": 6443
            }
        ],
        "sessionAffinity": "None",
        "type": "LoadBalancer"
    },
    "status": {
        "loadBalancer": {}
    }
},
{
"apiVersion": "v1",
    "kind": "Service",
    "metadata": {
        "labels": {
            "component": "apiserver",
            "provider": "kubernetes"
        },
        "name": "lb2",
        "namespace": "default",
    },
    "spec": {
        "clusterIP": "100.64.0.1",
        "ports": [
            {
                "name": "https",
                "port": 443,
                "protocol": "TCP",
                "targetPort": 6443
            }
        ],
        "sessionAffinity": "None",
        "type": "LoadBalancer"
    },
    "status": {
        "loadBalancer": {}
    }
}
]

test_lb_count_with_data {
    lb_request := {
        "request": {
            "kind": {
                "kind": "Service"
            },
            "operation": "CREATE",
            "object": {
                "spec": {
                    "clusterIP": "100.64.0.1",
                    "ports": [
                        {
                            "name": "https",
                            "port": 443,
                            "protocol": "TCP",
                            "targetPort": 6443
                        }
                    ],
                    "sessionAffinity": "None",
                    "type": "LoadBalancer"
                }
            }
        }
    }
    expect := "LoadBalancer Services are current at max capacity"
    admission.deny[expect] with input as lb_request  with data.kubernetes.services as services
}