# FRONT
curl -k -X DELETE \
  'https://185.212.225.123:9443/api/endpoints/2/docker/containers/sae4-front?force=true' \
    -H "X-API-Key:${API_KEY}"

curl -k -X POST \
  'https://185.212.225.123:9443/api/endpoints/2/docker/containers/create?name=sae4-front' \
  -H "X-API-Key:${API_KEY}" \
  -H 'Content-Type: application/json' \
  -d '{
    "Image": "sae4-front",
    "ExposedPorts": {
        "3000/tcp": {}
    },
    "HostConfig": {
        "PortBindings": {
            "3000/tcp": [{
                "HostPort": "3000"
            }]
        }
    }
}'

curl -k -X POST \
    'https://185.212.225.123:9443/api/endpoints/2/docker/containers/sae4-front/start' \
    -H "X-API-Key:${API_KEY}"


# BACK
curl -k -X DELETE \
  'https://185.212.225.123:9443/api/endpoints/2/docker/containers/sae4-back?force=true' \
    -H "X-API-Key:${API_KEY}"


curl -k -X POST \
  'https://185.212.225.123:9443/api/endpoints/2/docker/containers/create?name=sae4-back' \
  -H "X-API-Key:${API_KEY}" \
  -H 'Content-Type: application/json' \
  -d '{
    "Image": "sae4-back",
    "ExposedPorts": {
        "8000/tcp": {}
    },
    "HostConfig": {
        "PortBindings": {
            "8000/tcp": [{
                "HostPort": "8001"
            }]
        }
    }
}'

curl -k -X POST \
    'https://185.212.225.123:9443/api/endpoints/2/docker/containers/sae4-back/start' \
    -H "X-API-Key:${API_KEY}"
