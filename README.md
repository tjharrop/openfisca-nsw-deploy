# openfisca-nsw-deploy

## Running the Docker container locally
docker build -f openfisca_nsw_api.Dockerfile -t api_test .  
docker run -p 80:80 api_test
