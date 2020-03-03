FROM skpr/base:latest

RUN apk add --no-cache bash less ca-certificates python3 curl groff && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 get-pip.py && \
    pip install awscli

CMD ["aws", "help"]
