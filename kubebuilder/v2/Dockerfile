FROM golang:1.19

RUN go install golang.org/x/lint/golint@latest && \
    go install github.com/mitchellh/gox@latest && \
    go install k8s.io/code-generator/cmd/client-gen@v0.21.0 && \
    go install sigs.k8s.io/controller-tools/cmd/controller-gen@v0.2.4

ENV KUBEBUILDER_VERSION=2.3.1

RUN curl -L https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${KUBEBUILDER_VERSION}/kubebuilder_2.3.1_linux_amd64.tar.gz | tar -xz -C /tmp/ && \
    mv /tmp/kubebuilder_${KUBEBUILDER_VERSION}_linux_amd64/bin/kubebuilder /usr/local/bin/kubebuilder && \
    mv /tmp/kubebuilder_${KUBEBUILDER_VERSION}_linux_amd64/bin/kubectl /usr/local/bin/kubectl

RUN curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh" | bash && \
    mv kustomize /usr/local/bin/kustomize && \
    chmod +x /usr/local/bin/kustomize

ENV PATH /usr/local/kubebuilder/bin:$PATH

CMD ["bash"]
