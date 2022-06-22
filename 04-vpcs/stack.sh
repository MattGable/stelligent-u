#Bucket
#aws cloudformation validate-template --template-body file://vpc.yaml --template-file file://vpc-params.json

aws cloudformation create-stack --stack-name mattgvpcstack --template-body file://vpc.yaml  --parameters file://vpc-params.json

#aws cloudformation update-stack --stack-name mattgvpcstack --template-body file://vpc.yaml  --parameters file://vpc-params.json

#aws cloudformation delete-stack --stack-name mattgvpcstack