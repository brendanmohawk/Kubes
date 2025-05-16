FROM curlimages/curl:8.5.0 AS downloader

# Secure plugin download
WORKDIR /plugins
RUN curl -fsSL -o EssentialsX.jar https://github.com/EssentialsX/Essentials/releases/download/2.20.1/EssentialsX-2.20.1.jar && \
    curl -fsSL -L -o Vault.jar https://dev.bukkit.org/projects/vault/files/latest && \
    echo "Verifying SHA256 checksums..." && \
    echo "EXPECTED_SHA256_HERE  EssentialsX.jar" | sha256sum -c - && \
    echo "EXPECTED_SHA256_HERE  Vault.jar" | sha256sum -c -

FROM itzg/minecraft-server:java17

# Dedicated non root user
USER 1000

WORKDIR /data

RUN mkdir -p plugins
COPY --from=downloader /plugins/*.jar plugins/

RUN chmod -R 755 /data/plugins && \
    find /data/plugins -type f -exec chmod 644 {} \;

USER 1000
