pod install;
git add .; git commit -m "Updated podspec to $1";
git tag $1;
git push;
git push --tags;
pod lib lint ItemKit.podspec;
pod repo push SparkPodSpecs ItemKit.podspec;
pod trunk push ItemKit.podspec --allow-warnings;