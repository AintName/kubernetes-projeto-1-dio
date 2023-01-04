echo "Criando imagens..."

docker build -t aintname/projeto-backend:1.0 backend/.
docker build -t aintname/projeto-database:1.0 database/.

echo "Realizando push de imagens..."

docker push aintname/projeto-backend:1.0
docker push aintname/projeto-database:1.0

echo "Criando serviços no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando deployments..."

kubectl apply -f ./deployment.yml