# Cleanup Docker

February 11, 2021 · 3 min · Vinh

<details open="" style="box-sizing: border-box;"><summary accesskey="c" title="(Alt + C)" style="box-sizing: border-box; cursor: zoom-out; margin-inline-start: 20px;"><div class="details" style="box-sizing: border-box; display: inline; font-weight: 500;">Table of Contents</div></summary><div class="inner" style="box-sizing: border-box; margin: 0px 20px; padding: 10px 20px;"><ul style="box-sizing: border-box; padding: 0px; margin: 0px;"><li style="box-sizing: border-box;"><a href="https://hanami.run/blog/posts/cleanup-docker/#docker-stuff-that-accumulate" aria-label="Docker stuff that accumulate" style="box-sizing: border-box; color: rgba(197, 195, 193, 0.84); text-decoration: none;">Docker stuff that accumulate</a></li><li style="box-sizing: border-box;"><a href="https://hanami.run/blog/posts/cleanup-docker/#cleanup-with-docker" aria-label="Cleanup with docker" style="box-sizing: border-box; color: rgba(197, 195, 193, 0.84); text-decoration: none;">Cleanup with docker</a><ul style="box-sizing: border-box; padding: 0px; margin: 0px; margin-inline-start: var(--gap);"><li style="box-sizing: border-box;"><a href="https://hanami.run/blog/posts/cleanup-docker/#cleanup-stopped-containers" aria-label="Cleanup stopped containers" style="box-sizing: border-box; color: rgba(197, 195, 193, 0.84); text-decoration: none;">Cleanup stopped containers</a></li><li style="box-sizing: border-box;"><a href="https://hanami.run/blog/posts/cleanup-docker/#cleanup-volumes" aria-label="Cleanup volumes" style="box-sizing: border-box; color: rgba(197, 195, 193, 0.84); text-decoration: none;">Cleanup volumes</a></li><li style="box-sizing: border-box;"><a href="https://hanami.run/blog/posts/cleanup-docker/#cleanup-images" aria-label="Cleanup images" style="box-sizing: border-box; color: rgba(197, 195, 193, 0.84); text-decoration: none;">Cleanup images</a></li><li style="box-sizing: border-box;"><a href="https://hanami.run/blog/posts/cleanup-docker/#cleanup-networks" aria-label="Cleanup networks" style="box-sizing: border-box; color: rgba(197, 195, 193, 0.84); text-decoration: none;">Cleanup networks</a></li></ul></li><li style="box-sizing: border-box;"><a href="https://hanami.run/blog/posts/cleanup-docker/#cleanup-with-docker-compose" aria-label="Cleanup with docker-compose" style="box-sizing: border-box; color: rgba(197, 195, 193, 0.84); text-decoration: none;">Cleanup with docker-compose</a></li><li style="box-sizing: border-box;"><a href="https://hanami.run/blog/posts/cleanup-docker/#one-command-to-rule-them-all" aria-label="One command to rule them all" style="box-sizing: border-box; color: rgba(197, 195, 193, 0.84); text-decoration: none;">One command to rule them all</a></li></ul></div></details>

If you do heavy development with docker without a cleanup strategy soon your disk will fill at the time you really have to ship something out ASAP because production is on-fire but you cannot because docker refused to let you do anything with it.

When we run a process in our computers, once that process is done, everything is tear down together with it. Container is how many of us operating our infrastructure nowaday.

Everything run on a container, aim to have one process per container. When the process is done, the container is exit. But it won’t cleanup after itself. It leave behind its legacy.

# Docker stuff that accumulate

You need to keep an eyes on these

- stopped containers
- volume
- images
- network

If you have enough space, you may not worry too much about disk space but the network is an important one. By default, Docker uses bridge network, and it has a limit of 31 networks. When reaching that limit, you will see this message:

| `1 ` | `could not find an available, non-overlapping IPv4 address pool among the defaults to assign to the network ` |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

This happens if you’re a heavy docker-compose user which create a network per project. You can workaround by setting a customi `--subnet` such as:

| `1 ` | `docker network create dada --subnet 192.167.11.0/24 ` |
| ---- | ------------------------------------------------------ |
|      |                                                        |

But anyway, the point of this article is to clean up

# Cleanup with docker

## Cleanup stopped containers

| `1 ` | `docker rm -v $(docker ps --all --quiet --filter 'status=exited') ` |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

This will find all container in exited status and output their ID once per line so we can feed it to other shell command.

We use `docker rm -v` to also delete any anonymous volume(volumes without an explicitly name).

## Cleanup volumes

Above comand should remove volumes that are associated with that container. If you manually create volumes and want to delete any volumes that are not being used:

| `1 ` | `docker volume rm $(docker volume ls --quiet --filter 'dangling=true') ` |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

## Cleanup images

Docker images are generally safe to delete all. We can fetch them on-demand when we need to. Usually after a image cleaning, build time is longer because docker daemon has to spend time downloading image again

| `1 ` | `docker rm --force $(docker images --quiet) ` |
| ---- | --------------------------------------------- |
|      |                                               |

Here we used `--force` to delete images even if a container are using that. We can always fetch them again later

## Cleanup networks

Easy peasy. We can delete anything, it will be re-created on-demand later on

| `1 ` | `docker network rm $(docker network ls --quiet) ` |
| ---- | ------------------------------------------------- |
|      |                                                   |

# Cleanup with docker-compose

If you spin up containers using docker-compose, we have an easy way to cleanup resources associated with thart particular compose file.

| `1 ` | `docker-compose down --volumes --rmi all --remove-orphans ` |
| ---- | ----------------------------------------------------------- |
|      |                                                             |

Unfortunately this command won’t remove anonymous volume so you have to deal with them.

# One command to rule them all

docker is ephemeral and we can always re-fetch the image, re-seed our database for development, or this is just a CI system then we can delete verything

| `1 ` | `docker system prune --all --force --volumes ` |
| ---- | ---------------------------------------------- |
|      |                                                |

- 