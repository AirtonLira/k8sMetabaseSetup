kubectl delete configmap --all
kubectl delete pods --all
kubectl delete svc --all
#eval $(minikube docker-env)
kubectl apply -f repository/yamls/data-viz/metabase-configmap.yaml
kubectl apply -f repository/yamls/data-base/postgres.yaml
kubectl apply -f repository/yamls/data-viz/metabase.yaml
kubectl apply -f repository/yamls/setup/setup-metabase.yaml
kubectl apply -f repository/yamls/data-viz/metabase-loadbalance.yaml