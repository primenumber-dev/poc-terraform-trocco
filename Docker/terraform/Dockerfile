FROM hashicorp/terraform:1.12.2

# Install dependencies
RUN apk add --no-cache \
    curl \
    bash \
    jq \
    ca-certificates \
    nodejs \
    npm \
    make

# Install Claude Code CLI
RUN npm install -g @anthropic-ai/claude-code

# Install tflint
RUN curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash

WORKDIR /terraform

ENTRYPOINT ["/bin/bash"]
CMD ["-c", "while true; do sleep 30; done"]
