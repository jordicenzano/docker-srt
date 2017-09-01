# docker-srt
Docker image definition with compiled srt live streaming protocol

# Pulling docker image from docker hub
1. Ensure you have [docker](https://www.docker.com) installed
2. Type: `docker pull jcenzano/srt`

# Creating the docker image locally (optional)
1. Ensure you have docker [docker](https://www.docker.com) and make installed
2. Type `make`

# Testing the image
1. You can test the image with this command (you should see srt help):
```
docker run --rm -it jcenzano/srt
```

# Using the image

For now the SRT protocol only works with pipes, making this image almost useless :-(

```
TODO
```
