#!/usr/bin/env sh
SCRIPTPATH=$(dirname "$0")
ABSPATH=$(cd $SCRIPTPATH/..; pwd -P)

GEEKTOOLRUN=$(cat <<END
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Command</key>
        <string>$ABSPATH/run.sh</string>
	<key>DisplayStatusImage</key>
	<false/>
	<key>DropShadow</key>
	<false/>
	<key>GeekletFrame</key>
	<string>{{50, 50}, {100, 100}}</string>
	<key>HasShadow</key>
	<false/>
	<key>Identifier</key>
	<string>org.tynsoe.geeklet.shell</string>
	<key>Name</key>
	<string>Coverfy</string>
	<key>RefreshInterval</key>
	<integer>3</integer>
	<key>SetLocale</key>
	<true/>
</dict>
</plist>
END)

echo "$GEEKTOOLRUN" > $SCRIPTPATH/coverfy-run.glet

GEEKTOOLIMAGE=$(cat <<END
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>GeekletFrame</key>
	<string>{{70, 690}, {300, 300}}</string>
	<key>HasShadow</key>
	<false/>
	<key>Identifier</key>
	<string>org.tynsoe.geeklet.image</string>
	<key>ImageURL</key>
	<string>file://localhost$ABSPATH/output/output.tiff</string>
	<key>Name</key>
	<string>Coverfy</string>
	<key>Opacity</key>
	<real>1</real>
	<key>RefreshInterval</key>
	<integer>3</integer>
</dict>
</plist>
END)

echo "$GEEKTOOLIMAGE" > $SCRIPTPATH/coverfy-image.glet
