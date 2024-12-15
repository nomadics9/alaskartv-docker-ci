# Base image
FROM jellyfin/jellyfin:latest

# Copy your customization files directly into /jellyfin/jellyfin-web
COPY customization/ /jellyfin/jellyfin-web/

RUN chmod +x /jellyfin/jellyfin-web/update-index.sh && /jellyfin/jellyfin-web/update-index.sh

RUN chmod +x /jellyfin/jellyfin-web/titlechange.sh && /jellyfin/jellyfin-web/titlechange.sh


RUN apt-get update && apt-get install -y jq && rm -rf /var/lib/apt/lists/*
RUN chmod +x /jellyfin/jellyfin-web/titlechange.sh && /jellyfin/jellyfin-web/update-config.sh

# Expose the same ports as the base image
EXPOSE 8096

