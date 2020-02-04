FROM golang:1.13

ENV GO111MODULE=on

RUN go get golang.org/x/lint/golint && \
    go get github.com/mitchellh/gox && \
    go get k8s.io/code-generator/cmd/client-gen@v0.17.2 && \
    go get sigs.k8s.io/controller-tools/cmd/controller-gen@v0.2.4

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    mv kubectl /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl

RUN curl -L https://go.kubebuilder.io/dl/latest/linux/amd64 | tar -xz -C /tmp/ && \
    mv /tmp/kubebuilder_master_linux_amd64 /usr/local/kubebuilder

RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash && \
    mv kustomize /usr/local/bin/kustomize && \
    chmod +x /usr/local/bin/kustomize

ENV PATH /usr/local/kubebuilder/bin:$PATH

CMD ["bash"]
