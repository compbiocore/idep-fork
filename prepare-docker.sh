# Docker setup 


echo 'Pulling R docker image and building the proxy...'
docker build ./nginx/. -t nginx  #nginx image should be build very quick
docker pull compbiocore/idep-r-configuration:latest && docker tag compbiocore/idep-r-configuration:latest webapp:latest
echo 'Docker images have been obtained. Starting build of data files...'
echo ''
echo ''
echo 'Proxy and R webapp are ready.'
echo ''
echo ''
