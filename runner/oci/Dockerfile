ARG BASE_IMAGE=alpine:3.21

FROM ${BASE_IMAGE} AS base

ARG TARGETARCH

RUN apk -U upgrade && apk add --no-cache \
    bash \
    ca-certificates \
    curl \
    git \
    jq \
    openssh-client \
    openssh-keygen \
    python3 \
    tzdata

RUN [ -e /usr/bin/python ] || ln -s python3 /usr/bin/python

# Download infracost
ADD "https://github.com/infracost/infracost/releases/latest/download/infracost-linux-${TARGETARCH}.tar.gz" /tmp/infracost.tar.gz
RUN tar -xzf /tmp/infracost.tar.gz -C /bin && \
    mv "/bin/infracost-linux-${TARGETARCH}" /bin/infracost && \
    chmod 755 /bin/infracost && \
    rm /tmp/infracost.tar.gz

# Download Terragrunt.
ADD "https://github.com/gruntwork-io/terragrunt/releases/latest/download/terragrunt_linux_${TARGETARCH}" /bin/terragrunt
RUN chmod 755 /bin/terragrunt

RUN echo "hosts: files dns" > /etc/nsswitch.conf \
    && adduser --disabled-password --uid=1983 spacelift

FROM base AS oci-build

ENV PATH="/opt/venv/bin:$PATH"

RUN apk add --virtual=build --no-cache py3-pip gcc musl-dev python3-dev libffi-dev openssl-dev cargo make && \
    python3 -m venv /opt/venv && \
    pip install --no-cache-dir oci-cli && \
    apk del --purge build

RUN apk add curl openssl bash --no-cache
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl \
    && curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
    && chmod +x get_helm.sh && ./get_helm.sh

FROM base AS oci

ENV PATH="/opt/venv/bin:$PATH"

COPY --from=oci-build /opt/venv /opt/venv
COPY --from=oci-build /usr/local/bin/kubectl /usr/local/bin/kubectl
COPY --from=oci-build /usr/local/bin/helm /usr/local/bin/helm

RUN apk add --no-cache py3-pip && \
    oci --version && \
    terragrunt --version && \
    python --version && \
    infracost --version && \
    kubectl version --client && \
    helm version

USER spacelift