#!/bin/bash -xe
if [ -d "dist" ]; then
  rm -rf dist/
fi

mkdir -p dist/config
mkdir -p dist/lambda
mkdir -p dist/templates

cd config
tar cfz ../dist/config/word-press-nginx.tgz wordpress-nginx
cp -a opcache-instance-id.php ../dist/config
cd ..

cd lambda
zip ../dist/lambda/lambda.zip *.py
cd ..

cd templates
cp -a *.yaml ../dist/templates
cd ..