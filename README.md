# docker-srt
Docker image definition with compiled SRT live streaming protocol

# Pulling docker image from docker hub
1. Ensure you have [docker](https://www.docker.com) installed
2. Type: `docker pull jcenzano/docker-srt`

# Creating the docker image locally (optional)
1. Ensure you have docker [docker](https://www.docker.com) and make installed
2. Type `make`

# Testing the image
1. You can test the image with this command (you should see srt help):
```
docker run --rm -it jcenzano/docker-srt
```

# Using the image

According to my testing, for now the SRT protocol only works with pipes, making this image almost useless :-(.
See: https://github.com/Haivision/srt/issues/86

```
TODO (waiting to fix the problem with UDP input)
```
