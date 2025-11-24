.PHONY: package-lambda init-tf apply-tf destroy-tf upload-cf deploy-cf

package-lambda:
	cd lambda-src/hello && npm install --production && zip -r ../../hello.zip .

upload-lambda:
	aws s3 cp hello.zip s3://<LAMBDA_ARTIFACTS_BUCKET>/hello.zip

init-tf:
	cd terraform/envs/dev && terraform init

apply-tf:
	cd terraform/envs/dev && terraform apply -auto-approve

destroy-tf:
	cd terraform/envs/dev && terraform destroy -auto-approve

upload-cf:
	aws s3 cp cloudformation/nested/ s3://<CF_TEMPLATES_BUCKET>/cloudformation/nested/ --recursive

deploy-cf:
	aws cloudformation deploy --stack-name demo-root-stack \
	  --template-file cloudformation/root-stack.yaml \
	  --capabilities CAPABILITY_NAMED_IAM \
	  --parameter-overrides LambdaS3Bucket=<LAMBDA_ARTIFACTS_BUCKET> LambdaS3Key=hello.zip
