FROM golang:1.11

RUN go get github.com/golang/dep/cmd/dep && \
    go get sigs.k8s.io/kustomize && \
    go get golang.org/x/lint/golint && \
    go get github.com/go-task/task/cmd/task

ENV KUBEBUILDER_VERSION=1.0.6

RUN curl -L -O "https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${KUBEBUILDER_VERSION}/kubebuilder_${KUBEBUILDER_VERSION}_linux_amd64.tar.gz" && \
      tar -zxvf kubebuilder_${KUBEBUILDER_VERSION}_linux_amd64.tar.gz && \
      mv kubebuilder_${KUBEBUILDER_VERSION}_linux_amd64 /usr/local/kubebuilder

ENV PATH=$PATH:/usr/local/kubebuilder/bin

ENTRYPOINT ["kubebuilder"]
