# cd
cd /root/deploy

# clone project
git clone ${CLONE_URL} sae4

# copy dockerfiles
cd sae4/deploy
mkdir front
cp ./sae4/front/Dockerfile ./front/Dockerfile
mkdir back
cp ./sae4/back/Dockerfile ./back/Dockerfile   

# build images
cd front && docker build --build-arg CLONE_URL="${CLONE_URL}" --build-arg REACT_URL="${REACT_URL}" --build-arg REACT_PORT="${REACT_PORT}" -t sae4-front . --no-cache
cd ../back && docker build --build-arg CLONE_URL="${CLONE_URL}" --build-arg DATABASE_URL="${DATABASE_URL}" -t sae4-back . --no-cache

# remove containers
docker rm -f sae4-front
docker rm -f sae4-back

# deploy containers
docker run -d --name sae4-front -p 3000:3000 sae4-front
docker run -d --name sae4-back -p 8001:8000 sae4-back
