//
//  SSCRootViewController.m
//  WhatsAppActivityDemo
//
//  Created by Sascha Schwabbauer on 16.02.14.
//  Copyright (c) 2014 Sascha Schwabbauer. All rights reserved.
//

#import "SSCRootViewController.h"
#import "SSCWhatsAppActivity.h"

@interface SSCRootViewController ()

@end

@implementation SSCRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIButton *showActivitiesTextButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[showActivitiesTextButton setTitle:@"Show Activities (Text)" forState:UIControlStateNormal];
	[showActivitiesTextButton addTarget:self action:@selector(showActivitiesWithText:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:showActivitiesTextButton];
    [showActivitiesTextButton sizeToFit];
	[showActivitiesTextButton setFrame:CGRectMake(10, 20, CGRectGetWidth(showActivitiesTextButton.bounds), 50)];
    
    UIButton *showActivitiesImageButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[showActivitiesImageButton setTitle:@"Show Activities (Image)" forState:UIControlStateNormal];
	[showActivitiesImageButton addTarget:self action:@selector(showActivitiesWithImage:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:showActivitiesImageButton];
    [showActivitiesImageButton sizeToFit];
	[showActivitiesImageButton setFrame:CGRectMake(10, 60, CGRectGetWidth(showActivitiesImageButton.bounds), 50)];
}

- (void)showActivitiesWithText:(id)sender {
    NSString *stringToShare = @"This is a message I'd like to share via WhatsApp";
	NSURL *urlToShare = [NSURL URLWithString:@"https://github.com/sascha/SSCWhatsAppActivity"];
    
	SSCWhatsAppActivity *whatsAppActivity = [[SSCWhatsAppActivity alloc] init];
    
	UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[stringToShare, urlToShare] applicationActivities:@[whatsAppActivity]];
	
	[self presentViewController:activityViewController animated:YES completion:nil];
}

- (void)showActivitiesWithImage:(id)sender {
    UIImage *imageToShare = [UIImage imageNamed:@"shareImage.jpg"];
    
	SSCWhatsAppActivity *whatsAppActivity = [[SSCWhatsAppActivity alloc] init];
    
	UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[imageToShare] applicationActivities:@[whatsAppActivity]];
	
	[self presentViewController:activityViewController animated:YES completion:nil];
}

@end
