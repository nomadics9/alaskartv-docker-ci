FROM fallenbagel/jellyseerr:latest

RUN sed -i 's/Play on {mediaServerName}/Play on AlaskarTV/g' \
  /app/.next/static/chunks/*.js \
  /app/.next/static/chunks/pages/*/*.js \
  /app/.next/server/chunks/*.js \
  /app/.next/server/pages/*/*.js || true

COPY public/ /app/public

EXPOSE 5055
