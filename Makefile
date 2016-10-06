tests: update sort units printArt

ci: units 

bump:
	@./bin/bumpBuild.sh

clean:
	@xcodebuild -project OsusumeLunch.xcodeproj -scheme "OsusumeLunch" -sdk iphonesimulator -destination "platform=iOS Simulator,OS=10.0,name=iPhone 7" clean

printArt:
	@./bin/printArt.sh

sort:
	perl ./bin/sortXcodeProject OsusumeLunch.xcodeproj/project.pbxproj

units: osusumeUnits networkingUnits

osusumeUnits:
	@xcodebuild -project OsusumeLunch.xcodeproj -scheme "OsusumeLunch" -sdk iphonesimulator -destination "platform=iOS Simulator,OS=10.0,name=iPhone 7" build test

networkingUnits:
	@xcodebuild -project OsusumeLunch.xcodeproj -scheme "OsusumeNetworking" -sdk iphonesimulator -destination "platform=iOS Simulator,OS=10.0,name=iPhone 7" build test

update:
	@carthage update --platform iOS
