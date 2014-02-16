//
//  SSCWhatsAppActivity.m
//  SSCWhatsAppActivity
//
//  Created by Sascha Schwabbauer on 16.02.14.
//  Copyright (c) 2014 Sascha Schwabbauer. All rights reserved.
//

#import "SSCWhatsAppActivity.h"

NSString * const SSCActivityTypePostToWhatsApp = @"net.psyonic.activity.postToWhatsApp";

@interface SSCWhatsAppActivity ()

@property (nonatomic, copy) NSString *shareString;

@end

@implementation SSCWhatsAppActivity

static NSString *encodeByAddingPercentEscapes(NSString *input) {
    NSString *encodedValue = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)input, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8));
    
    return encodedValue;
}

- (NSString *)activityType {
    return SSCActivityTypePostToWhatsApp;
}

- (NSString *)activityTitle {
    return @"WhatsApp";
}

- (UIImage *)activityImage {
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        return [UIImage imageNamed:@"SSCWhatsAppIcon-iOS6"];
    } else {
        return [UIImage imageNamed:@"SSCWhatsAppIcon"];
    }
}

+ (UIActivityCategory)activityCategory {
    return UIActivityCategoryShare;
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    // No WhatsApp for iPad
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) return NO;
    
    NSURL *whatsAppURL = [NSURL URLWithString:@"whatsapp://app"];
    if (![[UIApplication sharedApplication] canOpenURL:whatsAppURL]) return NO;
    
    for (id item in activityItems) {
        if ([item isKindOfClass:[NSString class]] || [item isKindOfClass:[NSURL class]]) {
            return YES;
        }
    }
    
    return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    for (id item in activityItems) {
        if ([item isKindOfClass:[NSString class]]) {
            self.shareString = [(self.shareString ? self.shareString : @"") stringByAppendingFormat:@"%@%@", (self.shareString ? @" " : @""), item];
        } else if ([item isKindOfClass:[NSURL class]]) {
            self.shareString = [(self.shareString ? self.shareString : @"") stringByAppendingFormat:@"%@%@", (self.shareString ? @" " : @""), [(NSURL *)item absoluteString]];
        }
    }
}

- (void)performActivity {
    NSURL *whatsAppURL = [NSURL URLWithString:[NSString stringWithFormat:@"whatsapp://send?text=%@", encodeByAddingPercentEscapes(self.shareString)]];
    BOOL success = [[UIApplication sharedApplication] openURL:whatsAppURL];
    [self activityDidFinish:success];
}

@end
