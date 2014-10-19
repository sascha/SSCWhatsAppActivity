//
//  SSCWhatsAppActivity.m
//  SSCWhatsAppActivity
//
//  Created by Sascha Schwabbauer on 16.02.14.
//  Copyright (c) 2014 Sascha Schwabbauer. All rights reserved.
//

#import "SSCWhatsAppActivity.h"

NSString * const SSCActivityTypePostToWhatsApp = @"io.evolved.activity.postToWhatsApp";

@interface SSCWhatsAppActivity () <UIDocumentInteractionControllerDelegate>

@property (nonatomic, strong) UIDocumentInteractionController *documentInteractionController;
@property (nonatomic, strong) NSMutableArray *stringsToShare;
@property (nonatomic, strong) UIImage *imageToShare;
@property (nonatomic, assign, getter=isTextPreferred) BOOL textPreferred;

@end

@implementation SSCWhatsAppActivity

#pragma mark - Accessors

- (instancetype)initWithTextPreferred:(BOOL)preferText {
    if ((self = [super init])) {
        _textPreferred = preferText;
    }
    
    return self;
}

- (NSMutableArray *)stringsToShare {
    if (!_stringsToShare) {
        _stringsToShare = [NSMutableArray new];
    }
    
    return _stringsToShare;
}

#pragma mark - UIActivity

- (NSString *)activityType {
    return SSCActivityTypePostToWhatsApp;
}

- (NSString *)activityTitle {
    return @"WhatsApp";
}

- (UIImage *)activityImage {
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_6_1) {
        return [UIImage imageNamed:@"SSCWhatsAppIcon-iOS6"];
    } else if(floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1){
        return [UIImage imageNamed:@"SSCWhatsAppIcon-iOS7"];
    } else {
        return [UIImage imageNamed:@"SSCWhatsAppIcon-iOS8"];
    }
}

+ (UIActivityCategory)activityCategory {
    return UIActivityCategoryShare;
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    // No WhatsApp for iPad
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        return NO;
    }
    
    // Check if WhatsApp is installed
    NSURL *whatsAppURL = [NSURL URLWithString:@"whatsapp://app"];
    
    if (![[UIApplication sharedApplication] canOpenURL:whatsAppURL]) {
        return NO;
    }
    
    // Check for valid activityItems
    for (id item in activityItems) {
        if ([item isKindOfClass:[NSString class]] || [item isKindOfClass:[NSURL class]] || [item isKindOfClass:[UIImage class]]) {
            return YES;
        }
    }
    
    return NO;
}

- (void)prepareWithActivityItems:(NSArray *)activityItems {
    for (id item in activityItems) {
        if ([item isKindOfClass:[NSString class]]) {
            [self.stringsToShare addObject:item];
        } else if ([item isKindOfClass:[NSURL class]]) {
            [self.stringsToShare addObject:[(NSURL *)item absoluteString]];
        } else if ([item isKindOfClass:[UIImage class]]) {
            self.imageToShare = item;
        }
    }
}

- (void)performActivity {
    if (self.imageToShare && !self.isTextPreferred) {
        [self sendImageToDocumentInteractionController:self.imageToShare];
    } else {
        [self sendStringToWhatsApp:[self.stringsToShare componentsJoinedByString:@" "]];
    }
}

#pragma mark - Helper methods

static NSString *encodeByAddingPercentEscapes(NSString *input) {
    NSString *encodedValue = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)input, NULL, (CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8));
    
    return encodedValue;
}

- (void)sendStringToWhatsApp:(NSString *)stringToShare {
    NSURL *whatsAppURL = [NSURL URLWithString:[NSString stringWithFormat:@"whatsapp://send?text=%@", encodeByAddingPercentEscapes(stringToShare)]];
    BOOL success = [[UIApplication sharedApplication] openURL:whatsAppURL];
    [self activityDidFinish:success];
}

- (void)sendImageToDocumentInteractionController:(UIImage *)image {
    // Save with .wai extension so that it is only recognized by WhatsApp (see https://www.whatsapp.com/faq/en/iphone/23559013)
    NSURL *fileURL = [[NSURL fileURLWithPath:NSTemporaryDirectory() isDirectory:YES] URLByAppendingPathComponent:@"image.wai"];
    BOOL success = [UIImageJPEGRepresentation(image, 1.0) writeToURL:fileURL atomically:YES];
    
    if (success) {
        self.documentInteractionController = [UIDocumentInteractionController interactionControllerWithURL:fileURL];
        self.documentInteractionController.delegate = self;
        self.documentInteractionController.UTI = @"net.whatsapp.image";
        
        // Present UIDocumentInteractionController in topmost view
        UIView *view = [[UIApplication sharedApplication].keyWindow.subviews lastObject];
        [self.documentInteractionController presentOpenInMenuFromRect:view.bounds inView:view animated:YES];
    } else {
        [self activityDidFinish:NO];
    }
}

#pragma mark - UIDocumentInteractionControllerDelegate

- (void)documentInteractionController:(UIDocumentInteractionController *)controller willBeginSendingToApplication:(NSString *)application {
    [self activityDidFinish:YES];
}

@end
