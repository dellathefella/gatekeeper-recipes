# gatekeeper-recipes
Recipes for OPA Gatekeeper on GKE
kubectl create ns test9 && kubectl annotate ns test9 --overwrite protected=true
kubectl delete ns test9
kubectl create ns test9 && kubectl annotate ns test9 --overwrite protected=false
kubectl apply -f isolation.yaml && kubectl annotate -f isolation.yaml --overwrite protected=false
kubectl delete -f security.yaml
kubectl apply -f security.yaml && kubectl annotate -f security.yaml --overwrite protected=true