#### AWS Cli Latest version with python 3.9.10 and bash 4 available on dockerhub

[![image](https://user-images.githubusercontent.com/956227/151948683-da411a4a-938c-4486-b346-e8133520f9aa.png)](https://hub.docker.com/r/burib/aws-cli-python/tags?page=1&name=3.9.10)


### pull from docker hub

```sh
docker pull burib/aws-cli-python:3.9.10
```


### build
#### by default it builds python version 3.9.10
```sh
./docker.sh build
```  

#### but if you want to have a different version you can also pass it as an argument
```sh
./docker.sh build 3.10.2
```

### run
##### by default it runs the image with the python version 3.9.10 in interactive mode
```sh
./docker.sh run
```

#### # but you can run it with a different version as well by passing the argument

```sh
./docker.sh run 3.10.2
```
