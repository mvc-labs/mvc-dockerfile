# MVC Dockerfile

This is the dockerfile definition to help you build docker image and run MicroVisionChain in a containerized environment(DockerCompose Kubernetes etc).

Documentation: 

[DockerBuild](https://docs.mvclabs.io/docs/nodes/installation/docker-build)

[构建文档](https://docs.mvclabs.io/zh-CN/docs/nodes/installation/docker-build)


## Build Docker Image

```bash
bash docker-build.sh
```

## Run Docker Image

```bash
docker run microvisionchain:v0.2.0.0
```

## Run Docker Image by with mvc-cli

```bash
docker run microvisionchain:v0.2.0.0 mvc-cli help
```