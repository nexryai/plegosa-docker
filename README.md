## これは何
[Plegosa](https://github.com/syobocat/plegosa)の非公式Dockerイメージ

## Usage

```yaml
services:
    plegosa:
        image: ghcr.io/nexryai/plegosa:latest
        restart: unless-stopped
        init: true
        volumes:
            - ./config.toml:/var/app/config.toml:ro
```
