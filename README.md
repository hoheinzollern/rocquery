# Installation and usage

To build the image run:

```sh
docker build -t rocquery .
```

To run it:

```sh
docker run -it -p8000:8000 rocquery
```

substitute `-it` with `-d` if you wish to run the image in the background.