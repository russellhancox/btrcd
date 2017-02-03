btrcd
=====

btrcd (BlueTooth Remote Control Daemon) is a simple app that receives button
events from bluetooth headsets and converts them to equivalent keyboard events.
It is made possible because of the [MPRemoteCommandCenter] part of the
[MediaPlayer] framework.

I use it to control Google Play Music from my bluetooth headphones but it theory
it should work equally well for Spotify, etc.

The app has no UI. It's only an app because without an Info.plist it doesn't
receive next/previous events for some reason.

[MPRemoteCommandCenter]: https://developer.apple.com/reference/mediaplayer/mpremotecommandcenter?language=objc
[MediaPlayer]: https://developer.apple.com/reference/mediaplayer?language=objc

### Installation

1. Download the zip from the releases page.
2. Extract the zip and place the app somewhere (/Applications isn't a bad choice)
3. Launch the app. Nothing will appear to happen.
4. Test your head-{phones,set}.

If you want the app to launch when you start your computer add it to your
"Login Items" in System Preferences > Users & Groups.

### Uninstallation

1. Delete the app from wherever you installed it.

### Icon Credit

Icon was created by [Thierry Teyssier](https://twitter.com/thierryteyssier) and
listed on
[SketchAppSources](https://www.sketchappsources.com/free-source/34-ios-bluetooth-headphones-icon.html)

