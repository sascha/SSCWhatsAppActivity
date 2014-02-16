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
	
	UIButton *showActivitiesButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[showActivitiesButton setTitle:@"Show Activities" forState:UIControlStateNormal];
	[showActivitiesButton addTarget:self action:@selector(showActivities:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:showActivitiesButton];
	[showActivitiesButton setFrame:CGRectMake(10, 10, 120, 50)];
}

- (void)showActivities:(id)sender {
    NSString *stringToShare = @"This is a message I'd like to share via WhatsApp";
	NSURL *urlToShare = [NSURL URLWithString:@"https://github.com/sascha/SSCWhatsAppActivity"];
    	
	SSCWhatsAppActivity *whatsAppActivity = [[SSCWhatsAppActivity alloc] init];
    
	UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[stringToShare, urlToShare] applicationActivities:@[whatsAppActivity]];
	
	[self presentViewController:activityViewController animated:YES completion:nil];
}

@end
