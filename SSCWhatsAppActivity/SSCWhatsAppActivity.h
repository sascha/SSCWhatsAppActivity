//
//  SSCWhatsAppActivity.h
//  SSCWhatsAppActivity
//
//  Created by Sascha Schwabbauer on 16.02.14.
//  Copyright (c) 2014 Sascha Schwabbauer. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const SSCActivityTypePostToWhatsApp;

@interface SSCWhatsAppActivity : UIActivity

- (instancetype)initWithTextPreferred:(BOOL)preferText;

@end
