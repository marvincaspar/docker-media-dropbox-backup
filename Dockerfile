FROM alpine:edge

ADD install.sh install.sh
RUN sh install.sh && rm install.sh

ENV FOLDER_PATH ""
ENV ARCHIVE_NAME ""
ENV DROPBOX_PREFIX ""
ENV DROPBOX_ACCESS_TOKEN ""
ENV SCHEDULE ""

ADD run.sh run.sh
ADD backup.sh backup.sh

CMD ["sh", "run.sh"]
