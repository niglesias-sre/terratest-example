# terratest-example
Example of using Terratest in a GitHub action

## Running interactively 
To interact with ASW services, the following environment variables must be set:
  - `AWS_ACCESS_KEY_ID`: AWS Access Key to use
  - `AWS_SECRET_ACCESS_KEY`: AWS secret to use

You can [create a new access key on this page](https://console.aws.amazon.com/iam/home?#/security_credentials)

On first run, Terraform needs to initialize the working directory. Run:
```
terraform init
```

To create and/or modify AWS resources, run as usual:
```
terraform plan
terraform apply
```

## Testing
Testing with **terratest** is performed with GitHub actions.

TODO: add tests and documentation
