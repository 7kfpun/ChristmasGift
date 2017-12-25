#!/bin/bash

# Change the first name and the last name
firstName="FIRSTNAME"
lastName="LASTNAME"

# echo "Create iOS icons"
mobicon assets/profile.png -p=ios -o=ios/face/Images.xcassets/AppIcon.appiconset
cp assets/profile.png ios/face/Images.xcassets/AppIcon.appiconset/icon-1024.png

echo "Create Android icons"
mobicon assets/profile.png -p=android -o=android/app/src/main/res

rm android/app/src/main/res/mipmap-hdpi/ic_launcher.png
rm android/app/src/main/res/mipmap-ldpi/ic_launcher.png
rm android/app/src/main/res/mipmap-mdpi/ic_launcher.png
rm android/app/src/main/res/mipmap-xhdpi/ic_launcher.png
rm android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png
rm android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png

mv android/app/src/main/res/mipmap-hdpi/icon.png android/app/src/main/res/mipmap-hdpi/ic_launcher.png
mv android/app/src/main/res/mipmap-ldpi/icon.png android/app/src/main/res/mipmap-ldpi/ic_launcher.png
mv android/app/src/main/res/mipmap-mdpi/icon.png android/app/src/main/res/mipmap-mdpi/ic_launcher.png
mv android/app/src/main/res/mipmap-xhdpi/icon.png android/app/src/main/res/mipmap-xhdpi/ic_launcher.png
mv android/app/src/main/res/mipmap-xxhdpi/icon.png android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png
mv android/app/src/main/res/mipmap-xxxhdpi/icon.png android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png

# echo "Update name"
sed -i '' -e "s/非邊緣人/$firstName $lastName/g" ios/face/Base.lproj/LaunchScreen.xib
sed -i '' -e "s/非邊緣人/$firstName $lastName/g" ios/face/Info.plist
sed -i '' -e "s/非邊緣人/$firstName $lastName/g" android/app/src/main/res/values/strings.xml
sed -i '' -e "s/非邊/$firstName/g" App.js
sed -i '' -e "s/緣人/$lastName/g" App.js
