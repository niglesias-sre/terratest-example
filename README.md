# terratest-example
Example of using Terratest in a GitHub action

![tf-lint status](https://github.com/niglesias-sre/terratest-example/actions/workflows/tf-lint.yml/badge.svg)
![terratest status](https://github.com/niglesias-sre/terratest-example/actions/workflows/terratest.yml/badge.svg)

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

## Testing manually
```
cd test
go mod tidy
go test -v
```

## Testing with GitHub Actions
Testing with **terratest** is performed with GitHub actions.

There are 2 defined actions:
  - Terraform lint: defined in the `tf-lint.yml` file, checks syntax and style of the Terraform code
  - Automated Testing: defined in the `terratest.yml` file, provides automated testing with Terratest.

### Automated Testing action
This action uses a Github environment whith the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` defined as secrets.

The environment is referred in the `terratest.yml` workflow file.
