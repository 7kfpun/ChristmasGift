#!/bin/bash

firstName="Bryan"
lastName="Lie"

echo "Create iOS icons"
mobicon asset/profile.jpg -p=ios -o=ios/face/Images.xcassets/AppIcon.appiconset
cp asset/profile.jpg ios/face/Images.xcassets/AppIcon.appiconset/icon-1024.png

echo "Create Android icons"
mobicon asset/profile.jpg -p=android -o=android/app/src/main/res

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
# sed -i -e "s/非邊緣人/$firstName $lastName/g" ios/face/Base.lproj/LaunchScreen.xib
# sed -i -e "s/非邊緣人/$firstName $lastName/g" ios/face/Info.plist
