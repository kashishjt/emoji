#!/bin/bash

echo "This Script will build the package and deploy the Emoji React App"

BUILD_DIR=build

cd /var/lib/jenkins/workspace/ahfarmer_test/
sudo npm install -g npm@latest
nohup sudo npm start &

if [ -d $BUILD_DIR ]
then
	echo "$BUILD_DIR exists and deleting previous one to create new build..."
        sudo rm -rf $BUILD_DIR
	nohup sudo npm run build &
        sudo zip -qr $BUILD_DIR.zip $BUILD_DIR
else
	echo "$BUILD_DIR doesn't exist creating new build.."
        nohup sudo npm run build &
        sudo zip -qr $BUILD_DIR.zip $BUILD_DIR
fi

echo "######## BUILD PACKAGE buld.zip HAS BEEN CREATED AND READY TO DEPLOY #########"
echo "Your application is up and running on http://13.233.80.216:3000"

pid=`sudo fuser 3000/tcp`
if [ -z "$pid" ]
then
	echo "Your application is down, bringing it up...."
	nohup sudo npm start &
else
	echo "Your application is up and running..."
fi

