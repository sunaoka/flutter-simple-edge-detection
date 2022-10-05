#!/bin/bash

VERSION=4.6.0

CURDIR=$(pwd)
TMP="${CURDIR}"/tmp

mkdir -p "${TMP}"

curl https://jaist.dl.sourceforge.net/project/opencvlibrary/"${VERSION}"/opencv-"${VERSION}"-android-sdk.zip -o "${TMP}"/opencv-"${VERSION}"-android-sdk.zip
curl https://jaist.dl.sourceforge.net/project/opencvlibrary/"${VERSION}"/opencv-"${VERSION}"-ios-framework.zip -o "${TMP}"/opencv-"${VERSION}"-ios-framework.zip

unzip "${TMP}"/opencv-"${VERSION}"-android-sdk.zip -d "${TMP}"
unzip "${TMP}"/opencv-"${VERSION}"-ios-framework.zip -d "${TMP}"

rm -rf "${CURDIR}"/include
rm -rf "${CURDIR}"/android/src/main/jniLibs
rm -rf "${CURDIR}"/ios/opencv2.framework

mv "${TMP}"/OpenCV-android-sdk/sdk/native/jni/include "${CURDIR}"
mv "${TMP}"/OpenCV-android-sdk/sdk/native/libs "${CURDIR}"/android/src/main/jniLibs
mv "${TMP}"/opencv2.framework "${CURDIR}"/ios

rm -rf "${TMP}"/OpenCV-android-sdk
