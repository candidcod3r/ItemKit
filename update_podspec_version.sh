cd Example; pod install; cd ..;
git add .; git commit -m "Updated podspec to $1";
git tag $1;
git push;
git push --tags;
pod repo push SparkPodSpecs ItemKit.podspec;
pod trunk push ItemKit.podspec --allow-warnings;