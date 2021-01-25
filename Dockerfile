# 1. Build
FROM python:3.8-buster as builder

WORKDIR /opt/app

COPY requirements.lock /opt/app
RUN pip3 install -r requirements.lock

# 2. Run
FROM python:3.8-slim-buster as runner
COPY --from=builder /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages

RUN apt update \
  && apt install -y libpq5 libxml2 \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN useradd -r -s /bin/false pyusr
RUN mkdir -p /opt/app /mnt/hoge
RUN chown -R pyusr /opt/app /mnt/hoge

COPY hoge.py /opt/app

USER pyusr

EXPOSE 5000
CMD ["python", "/opt/app/hoge.py"]
