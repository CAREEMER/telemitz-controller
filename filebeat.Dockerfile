FROM docker.elastic.co/beats/filebeat:8.15.0

COPY --chown=root:root --chmod=600 filebeat.yml /usr/share/filebeat/filebeat.yml