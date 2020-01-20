# FPA
MobAppFPA

To Download:

Clone or Doneload the entire repository and save it in the desired folder

To Run:

1. Download XCode 11 from the App Store
2. Enter the Folder in Terminal where the download repository is stalled
3. If CocoaPods is not previously installed, type "sudo gem install cocoapods"
4. Run "pod init"
5. Vim into the Podfile
6. Uncomment the line that says: 
  platform :ios, '9.0'
7. Under "Pods for FPA", add:
  pod 'Firebase/Analytics'
  pod 'Firebase/Auth'
  pod 'Firebase/Database'
8. Run "pod install" (if this has been done before, running "pod update" will suffice"
9. Doing this will add a file called "FPA.xcworkspace" in this folder, open this in Xcode 11
10. Press the run button on the top left of the IDE and you're good to go!
