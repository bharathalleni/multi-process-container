FROM python:3-alpine

RUN apk add --no-cache \
	nginx \
	bash
# Tes11t11ing
RUN pip install Flask
ENV TINI_VERSION v0.18.0
# Testing 3
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini-static /tini
RUN chmod +x /tini
WORKDIR /src
COPY . .

ENTRYPOINT ["/tini", "--", "./start.sh"]
