# SSCWhatsAppActivity

[![Version](http://cocoapod-badges.herokuapp.com/v/SSCWhatsAppActivity/badge.png)](http://cocoadocs.org/docsets/foo)
[![Platform](http://cocoapod-badges.herokuapp.com/p/SSCWhatsAppActivity/badge.png)](http://cocoadocs.org/docsets/foo)

## Requirements

iOS 6.0+ is required.

## Installation

SSCWhatsAppActivity is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your Podfile:

	pod "SSCWhatsAppActivity"

## Usage

Typical usage will look something like this:

	NSString *stringToShare = @"This is a message I'd like to share via WhatsApp";
	NSURL *urlToShare = [NSURL URLWithString:@"https://github.com/sascha/SSCWhatsAppActivity"];
    	
	SSCWhatsAppActivity *whatsAppActivity = [[SSCWhatsAppActivity alloc] init];
    
	UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[stringToShare, urlToShare] applicationActivities:@[whatsAppActivity]];
	
	[self presentViewController:activityViewController animated:YES completion:nil];
	
Have a look at the demo app to see it in context.

![Demo screenshot](https://raw.github.com/sascha/SSCWhatsAppActivity/master/screenshot.png)

## Author

Sascha Schwabbauer, sascha.schwabbauer@me.com

## License

foo is available under the MIT license. See the LICENSE file for more info.
