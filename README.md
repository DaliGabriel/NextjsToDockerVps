
## Getting Started with the image creation

First, login into a docker using your user github name and the token(classic) as password:

```
docker login ghcr.io
```

Next, build the image locally with the same structure only change the name of the image:

```
docker build . --platform linux/amd64 -t ghcr.io/github-name/image-name
```
And then, upload the image to your github packages:

```
 docker push ghcr.io/github-name/image-name
```

## Continue with the deployment on the server

First, login into a docker using your user github name and the token(classic) as password:

```
docker login ghcr.io
```

Next, download the update docker image:

```
sudo docker pull ghcr.io/github-name/image-name:latest
```

keep, looking our docker active process:

```
sudo docker ps
```

Continue, stopping the docker container:

```
sudo docker stop {CONTAINER ID or NAMES}
```

Remove all the stopper containers

```
sudo docker container prune
```

If you want to remove an specific image

```
sudo docker rmi {IMAGE ID}
```

Remove all unused images keep the lastest

```
sudo docker image prune
```

Remove all unused images keep the lastest

```
sudo docker run -d -p 3000:3000 ghcr.io/github-name/image-name:latest
```



# NextjsToDockerVps
