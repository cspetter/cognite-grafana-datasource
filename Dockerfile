FROM node:9 as builder

# Builds cognite-grafana-datasource
WORKDIR /app

COPY . /app
RUN yarn
RUN yarn build

FROM grafana/grafana:5.2.3
# Copy the plugin into the grafana plugin folder
COPY --from=builder /app/. /var/lib/grafana/plugins/cognite-grafana-datasource
