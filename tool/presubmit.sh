#!/bin/sh

set -e
cd `dirname $0`/..

echo "----------------------------------------------------------------------------------------------------"
echo "Running: dartfmt --fix -w ."
echo "----------------------------------------------------------------------------------------------------"
dartfmt --fix -w .

echo "----------------------------------------------------------------------------------------------------"
echo "Running: pub run test"
echo "----------------------------------------------------------------------------------------------------"
pub get --offline
pub run test

echo "----------------------------------------------------------------------------------------------------"
echo "Running: flutter test"
echo "         (in directory 'test_in_flutter')"
echo "----------------------------------------------------------------------------------------------------"
cd test_in_flutter
flutter pub get --offline
flutter test
cd ..