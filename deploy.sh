docker build -t vignehjeyaraman/multi-client:latest -t vignehjeyaraman/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t vignehjeyaraman/multi-server:latest -t vignehjeyaraman/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t vignehjeyaraman/multi-worker:latest -t vignehjeyaraman/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push vigneshjeyaraman2794/multi-client:latest
docker push vigneshjeyaraman2794/multi-server:latest
docker push vigneshjeyaraman2794/multi-worker:latest

docker push vigneshjeyaraman2794/multi-client:$SHA
docker push vigneshjeyaraman2794/multi-server:$SHA
docker push vigneshjeyaraman2794/multi-worker:$SHA

kubectl apply -f k8s/
kubectl set imaage deployments/server-deployment server=vigneshjeyaraman2794/multi-server:$SHA
kubectl set imaage deployments/client-deployment client=vigneshjeyaraman2794/multi-client:$SHA
kubectl set imaage deployments/worker-deployment worker=vigneshjeyaraman2794/multi-worker:$SHA