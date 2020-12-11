package kubernetes.admission

import data.kubernetes.services

lbs[name] { 
    service := services[namespace]
    service.spec.type == "LoadBalancer"
    name = service
    }

deny[msg] {
    input.request.kind.kind = "Service"
    input.request.operation = "CREATE"
    input.request.object.spec.type = "LoadBalancer"
    lbcount := count(lbs)
    lbcount >= 2
    msg = sprintf("LoadBalancer Services are current at max capacity of %v",[lbcount])
}