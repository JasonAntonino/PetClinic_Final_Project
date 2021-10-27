output "manager_ip" {
  value = module.EC2.instance_public_IP
}

output "worker_ip" {
  value = module.EC2.worker_ip
}

output "jenkins_ip" {
  value = module.EC2.jenk_ip
}