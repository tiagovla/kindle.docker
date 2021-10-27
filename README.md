# kindle.docker

### How to run it:
```bash
docker run -it --net=host \
--env="DISPLAY" \
--volume="$HOME/.Xauthority:/home/kindle/.Xauthority:rw" \
tiagovla/kindle:1.16
```


### How to mount books to a folder:
```bash
mkdir data # books will be saved here
docker run -it --net=host \
--env="DISPLAY" \
--volume="$HOME/.Xauthority:/home/kindle/.Xauthority:rw" \
--mount type=volume,dst="/home/kindle/.wine/drive_c/users/kindle/My Documents/My Kindle Content",volume-driver=local,volume-opt=type=none,volume-opt=o=bind,volume-opt=device=$PWD/data \
kindle
```

```bash
docker build -t kindle . # inside repo
mkdir data
docker run -it --net=host \
--env="DISPLAY" \
--volume="$HOME/.Xauthority:/home/kindle/.Xauthority:rw" \
--mount type=volume,dst="/home/kindle/.wine/drive_c/users/kindle/My Documents/My Kindle Content",volume-driver=local,volume-opt=type=none,volume-opt=o=bind,volume-opt=device=$PWD/data \
kindle

```
