FROM itzg/minecraft-server

RUN mkdir -p /data/plugins

ADD https://github.com/EssentialsX/Essentials/releases/download/2.20.1/EssentialsX-2.20.1.jar /data/plugins/EssentialsX.jar
ADD https://dev.bukkit.org/projects/vault/files/latest /data/plugins/Vault.jar

RUN chown -R 1000:1000 /data
