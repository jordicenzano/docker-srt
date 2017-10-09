# docker-srt
Docker image definition with compiled [SRT](https://github.com/Haivision/srt) live streaming protocol

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
2. To test it in a single machine with real live video, if you have [ffmpeg](https://www.ffmpeg.org/) installed you can do:
```
#Terminal 1: Run SRT RX
MY_IP="10.0.0.2" #Replace it with your machine's IP
docker run --name='srt-rx' -it --rm  jcenzano/docker-srt -v -r:10 -s:5 "srt://0.0.0.0:9000?mode=server" "udp://$MY_IP:7010?mode=client"

#Terminal 2: Run SRT TX
docker run --name='srt-tx' --link='srt-rx' -it --rm -p 7000:7000/udp jcenzano/docker-srt -v -r:10 -s:5 "udp://:7000" "srt://srt-rx:9000?mode=client"

#Terminal 3: Run ffplay viewer
ffplay udp://127.0.0.1:7010

#Terminal 4: Run ffmpeg source
ffmpeg -f lavfi -re -i smptebars=duration=60:size=1280x720:rate=30 -f lavfi -re -i sine=frequency=1000:duration=60:sample_rate=44100 -pix_fmt yuv420p -c:v libx264 -b:v 1000k -g 30 -keyint_min 120 -profile:v baseline -preset veryfast -c:a libfdk_aac -b:a 96k -f mpegts "udp://127.0.0.1:7000?pkt_size=1316&flush_packets=0"
```

# Using the image
The docker container is executing `stransmit` from SRT, so you can use any of the SRT options.

Note: It is important to point out that if you use UDP as input of SRT the payload of the UDP packets has to be smaller or equal to 1456 bytes (See: https://github.com/Haivision/srt/issues/86)  
