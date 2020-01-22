# paperspigot-docker
Easy to use and clean docker image for running paper spigot servers in docker containers using OpenJDK. 

You may also be interest in [waterfall-docker](https://github.com/FelixKlauke/waterfall-docker) if you want to build a whole server network.

# Getting started
The easiest way for a quick start would be:
```bash
docker run -it \
    -p 25565:25565 \
    -v ~/minecraft/config:/opt/minecraft/config \
    -v ~/minecraft/worlds:/opt/minecraft/worlds \
    -v ~/minecraft/plugins:/opt/minecraft/plugins \
    -v ~/minecraft/data:/opt/minecraft/data \
    -v ~/minecraft/logs:/opt/minecraft/logs \
    kloppz/papermc:1.15.2
```

# Tags and Versions
The docker images are tagged for their minecraft versions. Therefor you can currently choose between this versions:
- `kloppz/paperspigot:1.15.2` 

The specific images are update by hand. The 1.x-latest images will update at nightly builds and will always
use the latest build.

# Volumes
There are five volumes used for:
- Worlds
- Plugins
- Config files (paper.yml, bukkit.yml, spigot.yml, server.properties, commands.yml)
- Data (banned-ips.json, banned-players.json, help.yml, ops.json, permissions.yml, whitelist.json)
- Logs

You can find the mount locations in the `docker-compose.yml`

# docker-compose.yml
You can add this simple entry to your docker-compose.yml when using mounted folders:
```yaml
version: '3.7'

services:
  minecraft:
    image: kloppz/papermc:1.15.2
    container_name: minecraft
    stdin_open: true
    tty: true
    restart: always
    networks:
      - minecraft
    ports:
      - 25565:25565
    volumes:
      - ./config:/opt/minecraft/config
      - ./worlds:/opt/minecraft/worlds
      - ./plugins:/opt/minecraft/plugins
      - ./data:/opt/minecraft/data
      - ./logs:/opt/minecraft/logs

networks:
  minecraft: {}

```

When you want to use explicit volumes, you can use this:
```yaml 
version: '3.7'

services:
  minecraft:
    image: kloppz/papermc:1.15.2
    container_name: minecraft
    stdin_open: true
    tty: true
    restart: always
    networks:
      - minecraft
    ports:
      - 25565:25565
    volumes:
      - minecraft-config:/opt/minecraft/config
      - minecraft-worlds:/opt/minecraft/worlds
      - minecraft-plugins:/opt/minecraft/plugins
      - minecraft-data:/opt/minecraft/data
      - minecraft-logs:/opt/minecraft/logs

volumes:
  minecraft-config: {}
  minecraft-worlds: {}
  minecraft-plugins: {}
  minecraft-data: {}
  minecraft-logs: {}

networks:
  minecraft: {}

```
