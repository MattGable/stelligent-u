#!/bin/bash

STACK_NAME=$1
REGION=us-east-1
PROFILE=matthew.gable.labs

export AWS_PROFILE=$PROFILE

validate_stack() {
    aws cloudformation validate-template --template-body file://${STACK_NAME}.yaml --region $REGION
    cfn_nag_scan --input-path=${STACK_NAME}.yaml
}

create_stack() {
    aws cloudformation create-stack --stack-name ${STACK_NAME} --template-body file://$STACK_NAME.yaml --capabilities CAPABILITY_NAMED_IAM
}

update_stack() {
    aws cloudformation update-stack --stack-name ${STACK_NAME} --template-body file://$STACK_NAME.yaml --capabilities CAPABILITY_NAMED_IAM
}

delete_stack() {
    aws cloudformation delete-stack --stack-name ${STACK_NAME}
}

wait_until_stack_create_completes() {
    echo "Waiting for stack to complete..."

    aws cloudformation wait stack-create-complete \
    --region ${REGION}  \
    --stack-name ${STACK_NAME}
    status=$?

    if [[ ${status} -ne 0 ]] ; then
        # Waiter encountered a failure state.
        echo "Stack [${STACK_NAME}] creation failed. AWS error code is ${status}."

        exit ${status}
    fi
}

wait_until_stack_update_completes() {
    echo "Waiting for stack to complete..."

    aws cloudformation wait stack-create-complete \
    --region ${REGION}  \
    --stack-name ${STACK_NAME}
    status=$?

    if [[ ${status} -ne 0 ]] ; then
        # Waiter encountered a failure state.
        echo "Stack [${STACK_NAME}] update failed. AWS error code is ${status}."

        exit ${status}
    fi
}

wait_until_stack_destroys() {
    echo "Waiting for stack to destroy..."

    aws cloudformation wait stack-delete-complete \
    --region ${REGION}  \
    --stack-name ${STACK_NAME}
    status=$?

    if [[ ${status} -ne 0 ]] ; then
        # Waiter encountered a failure state.
        echo "Stack [${STACK_NAME}] deletion failed. AWS error code is ${status}."

        exit ${status}
    fi
}   

# Run
# validate_stack
# create_stack
# wait_until_stack_create_completes

validate_stack
update_stack
wait_until_stack_update_completes

# delete_stack
# wait_until_stack_destroys