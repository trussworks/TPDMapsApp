# TPDMapsApp

An interface to external mapping applications on iOS.

## Build Status

[![CircleCI](https://circleci.com/gh/trussworks/TPDMapsApp.svg?style=svg)](https://circleci.com/gh/trussworks/TPDMapsApp)

## Usage

    #import <TPDMapsApp/TPDMapsApp.h>

    ...

    NSArray *installedApps = [TPDMapsApp installedMapsApps];

    TPDMapsApp *app = [installedApps firstObject];

    NSLog(%"Using map app: %@", app.name);

    BOOL opened = app.openWithQuery(@"Philz Coffee");
    if (! opened) {
        // Something went wrong...
    }

    opened = app.openForDirectionsWithStart:@"1 Stockton St, San Francisco, CA"
                                destination:@"3101 24th St, San Francisco, CA"
                                 travelMode:TPDMapsAppTravelModeTransit];

    if (! opened) {
        // Something went wrong...
    }

## Installation

Use CocoaPods.

    $ edit Podfile
    pod 'TPDMapsApp', '~> 1.1.0'

    $ pod install

    $ open App.xcworkspace

Then you will need to update your application's `Info.plist` with the following:

    <key>LSApplicationQueriesSchemes</key>
    <array>
        <string>comgooglemaps</string>
        <string>waze</string>
    </array>

## Release

Make sure that TPDMapsApp.podspec has the right version set in `s.version`.

Find the commit hash of the release via `git log`, then tag it with that version. For example:

    git tag -a -s 1.1.2 $COMMIT_HASH
    git push upstream 1.1.2

Then, make sure the podspec is still right:

    bundle exec pod spec lint

Assuming it passes, publish the new spec:

    # Verify that you have an active session.
    bundle exec pod trunk me
    # Push the new spec to Cocoapods.
    bundle exec pod trunk push TPDMapsApp.podspec

## License

TPDMapsApp is available under the MIT license. See the LICENSE file for more info.
