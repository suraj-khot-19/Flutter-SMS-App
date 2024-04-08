# creating app which send SMS to any mobile number

![ss1](https://github.com/suraj-khot-19/img/blob/main/img1.png)
![ss2](https://github.com/suraj-khot-19/img/blob/main/img2.png)
![ss3](https://github.com/suraj-khot-19/img/blob/main/img3.png)

<b>pub.dev</b><br>

<li>packages</li><br>
<h3>1. url_launcher <br><link>https://pub.dev/packages/url_launcher/</link></h3><br>
<li>instalation</li><br>
<pre>This will add a line like this to your package's pubspec.yaml (and run an implicit flutter pub get):
<br>
dependencies:
  url_launcher: ^6.2.5
Alternatively, your editor might support flutter pub get. Check the docs for your editor to learn more.
<br>
Import it
Now in your Dart code, you can use:
<br>
import 'package:url_launcher/url_launcher.dart';
<br></pre><br>
<li>Configuration </li>
<pre>
<br>
<b>iOS </b>
Add any URL schemes passed to canLaunchUrl as LSApplicationQueriesSchemes entries in your Info.plist file, otherwise it will return false.
<br>
<b>Android</b>
Add any URL schemes passed to canLaunchUrl as <queries> entries in your AndroidManifest.xml, otherwise it will return false in most cases starting on Android 11 (API 30) or higher. Checking for supportsLaunchMode(LaunchMode.inAppBrowserView) also requires a <queries> entry to return anything but false. A <queries> element must be added to your manifest as a child of the root element.
</pre>
