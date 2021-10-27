output "jenkins_ip" {
  value = module.EC2.jenk_ip
}
output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}