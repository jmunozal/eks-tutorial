resource "aws_eks_cluster" "demo" {
  name            = "${var.cluster-name}"
  role_arn        = "${aws_iam_role.eksServiceRole.arn}"

  vpc_config {
    security_group_ids = ["${aws_security_group.demo-cluster.id}"]
    subnet_ids         = ["${aws_subnet.subnet.*.id}"]
  }

  depends_on = [
    "aws_iam_role_policy_attachment.cluster-attach",
    "aws_iam_role_policy_attachment.service-attach",
  ]
}

# kubernetes
#locals {
#  kubeconfig = <<KUBECONFIG
#
#
#apiVersion: v1
#clusters:
#- cluster:
#    server: ${aws_eks_cluster.demo.endpoint}
#    certificate-authority-data: ${aws_eks_cluster.demo.certificate_authority.0.data}
#  name: kubernetes
#contexts:
#- context:
#    cluster: kubernetes
#    user: aws
#  name: aws
#current-context: aws
#kind: Config
#preferences: {}
#users:
#- name: aws
#  user:
#    exec:
#      apiVersion: client.authentication.k8s.io/v1alpha1
#      command: aws-iam-authenticator
#      args:
#        - "token"
#        - "-i"
#        - "${var.cluster-name}"
#KUBECONFIG
#}

#output "kubeconfig" {
#  value = "${local.kubeconfig}"
#}
