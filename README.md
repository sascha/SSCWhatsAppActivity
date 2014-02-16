# SSCWhatsAppActivity

#### A UIActivity subclass for sharing messages with WhatsApp.

## Usage

Typical usage will look something like this:

	NSString *stringToShare = @"This is a message I'd like to share via WhatsApp";
	NSURL *urlToShare = [NSURL URLWithString:@"https://github.com/sascha/SSCWhatsAppActivity"];
    	
	SSCWhatsAppActivity *whatsAppActivity = [[SSCWhatsAppActivity alloc] init];
    
	UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[stringToShare, urlToShare] applicationActivities:@[whatsAppActivity]];
	
	[self presentViewController:activityViewController animated:YES completion:nil];
	
Have a look at the demo app to see it in context.

![Demo screenshot](https://raw.github.com/sascha/SSCWhatsAppActivity/master/screenshot.png)
