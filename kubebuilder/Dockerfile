FROM golang:1.12

RUN go get github.com/golang/dep/cmd/dep && \
    go get golang.org/x/lint/golint

RUN curl -sSL https://github.com/kubernetes-sigs/kustomize/releases/download/v3.1.0/kustomize_3.1.0_linux_amd64 -o /usr/local/bin/kustomize && \
    chmod +rx /usr/local/bin/kustomize

ENV KUBEBUILDER_VERSION=1.0.6

RUN curl -L -O "https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${KUBEBUILDER_VERSION}/kubebuilder_${KUBEBUILDER_VERSION}_linux_amd64.tar.gz" && \
      tar -zxvf kubebuilder_${KUBEBUILDER_VERSION}_linux_amd64.tar.gz && \
      mv kubebuilder_${KUBEBUILDER_VERSION}_linux_amd64 /usr/local/kubebuilder

ENV PATH=$PATH:/usr/local/kubebuilder/bin

ENTRYPOINT ["kubebuilder"]
