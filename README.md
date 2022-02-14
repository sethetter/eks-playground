# messing around with EKS

starting with [this article](https://learn.hashicorp.com/tutorials/terraform/eks)

## architecture overiew

- vpc and subnets, one availability zone
- public subnet
  - load balancer
  - nat / internet gateways?
- private subnet
  - eks cluster

## network

- public subnet
  - nat gateway
  - internet gateway
  - route 10.0.1.0/24 to private subnet A
  - route 10.0.2.0/24 to private subnet B
- private subnets
  - route 0.0.0.0/0 to public nat gw
