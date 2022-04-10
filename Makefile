
BUCKET=lx-cicd-sample-296066267476
PREFIX=cloudformation
STACK_NAME=lx-cicd-sample

package:
	mkdir -p build
	aws cloudformation package \
		--template-file ./cfn_src/cloudformation.yml \
		--s3-bucket ${BUCKET} \
		--s3-prefix ${PREFIX} \
		--output-template-file ./build/cloudformation.yml

deploy:
	aws cloudformation deploy \
		--template-file ./build/cloudformation.yml \
		--stack-name ${STACK_NAME} \
		--parameter-overrides `cat ./cfn_src/params/params.properties`


all: package deploy