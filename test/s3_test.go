package test

import (
	"crypto/tls"
	"testing"

	http_helper "github.com/gruntwork-io/terratest/modules/http-helper"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestTerraform(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "..",
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	test1URL := terraform.Output(t, terraformOptions, "test1_url")
	test2URL := terraform.Output(t, terraformOptions, "test2_url")
	timestamp := terraform.Output(t, terraformOptions, "timestamp")

	// Setup a TLS configuration to submit with the helper, a blank struct is acceptable
	tlsConfig := tls.Config{}

	// Verify that we get back a 200 OK with the expected instanceText
	http_helper.HttpGetWithValidation(t, test1URL, &tlsConfig, 200, timestamp)
	http_helper.HttpGetWithValidation(t, test2URL, &tlsConfig, 200, timestamp)
}
