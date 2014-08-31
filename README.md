# SSCWhatsAppActivity

[![Version](http://cocoapod-badges.herokuapp.com/v/SSCWhatsAppActivity/badge.png)](http://cocoadocs.org/docsets/SSCWhatsAppActivity)
[![Platform](http://cocoapod-badges.herokuapp.com/p/SSCWhatsAppActivity/badge.png)](http://cocoadocs.org/docsets/SSCWhatsAppActivity)

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
	
Please note that you can only share instances of `NSString`, `NSURL` or `UIImage`. WhatsApp does not support sharing text and images at the same time, so as soon as you provide an `UIImage` all `NSString` and `NSURL` instances will be ignored. In addition you can only share **one** `UIImage`. Have a look at the demo app to see it in context.

![Demo screenshot](https://raw.github.com/sascha/SSCWhatsAppActivity/master/screenshot.png)

## Author

Sascha Schwabbauer, sascha@evolved.io

## License

SSCWhatsAppActivity is available under the MIT license. See the LICENSE file for more info.
