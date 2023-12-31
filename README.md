# chs-log-scraper

Infrastructure code for the provisioning of object storage for CHS environment service logs.

## Overview

An S3 bucket is provisioned along with a suitable bucket policy to allow log files from CHS environments to be synchronised to the bucket. Data is encrypted at rest using [server-side encryption](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingServerSideEncryption.html) with Amazon S3 managed encryption keys (SSE-S3). The bucket policy blocks unencrypted objects, server-side encryption with AWS Key Management Service (AWS KMS) keys (SSE-KMS), and server-side encryption with customer-provided keys (SSE-C).

## Branching Strategy

This project uses a trunk-based branching strategy and infrastructure changes are versioned and applied from the `main` branch after merge via the [infrastructure pipeline](https://github.com/companieshouse/ci-pipelines/blob/master/pipelines/platform/team-platform/chs-log-scraper):

```mermaid
%%{init: { 'logLevel': 'debug', 'theme': 'default' , 'themeVariables': {
    'git0': '#4585ed',
    'git1': '#edad45'
} } }%%
gitGraph
commit
branch feature
commit
commit
commit
checkout main
merge feature tag: "1.0.0"
```
## License

This project is subject to the terms of the [MIT License](/LICENSE).
