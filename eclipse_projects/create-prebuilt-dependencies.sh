#!/bin/bash -e

DIR=$(dirname $0)
pushd $DIR

DEPVER=$1

if [ -z "$DEPVER" ]
then
  echo "$0 dependencies_version"
  echo "Example: $0 1"
  exit 1
fi

PROJECT=libs
./bVNC/prepare_project.sh $PROJECT $ANDROID_NDK $ANDROID_SDK
./Opaque/prepare_project.sh $PROJECT $ANDROID_NDK $ANDROID_SDK
pushd ..
tar czf remote-desktop-clients-libs-${DEPVER}.tar.gz Opaque/libs bVNC/libs Opaque/jni/libs/deps/FreeRDP/client/Android/Studio/freeRDPCore/

echo "Done creating new dependencies archive."
popd
popd
