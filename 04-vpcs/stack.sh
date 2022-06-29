#VPC
#aws cloudformation validate-template --template-body file://vpc.yaml

#aws cloudformation create-stack --stack-name mattgvpcstack --template-body file://vpc.yaml  --parameters file://vpc-params.json

#aws cloudformation update-stack --stack-name mattgvpcstack --template-body file://vpc.yaml  --parameters file://vpc-params.json

aws cloudformation delete-stack --stack-name mattgvpcstack

# Instance
#aws cloudformation validate-template --template-body file://instance.yaml

#aws cloudformation create-stack --stack-name mattginstancestack --template-body file://instance.yaml --parameters file://instance-params.yaml

#aws cloudformation update-stack --stack-name mattginstancestack --template-body file://instance.yaml --parameters file://instance-params.yaml

#aws cloudformation delete-stack --stack-name mattginstancestack