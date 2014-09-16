# TPDMapsApp

An interface to external mapping applications on iOS.

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

Use Cocoapods.

    $ edit Podfile
    pod 'TPDMapsApp', '~> 1.0.0'
    
    $ pod install
    
    $ open App.xcworkspace
    
## License

TPDMapsApp is available under the MIT license. See the LICENSE file for more info.

    
