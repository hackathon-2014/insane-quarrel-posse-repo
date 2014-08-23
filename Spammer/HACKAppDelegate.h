//
//  HACKAppDelegate.h
//  Spammer
//
//  Created by admin on 8/23/14.
//  Copyright (c) 2014 worldquest. All rights reserved.
//

#import <UIKit/UIKit.h>

// Global project constants
static const uint32_t kPlayerCategory   =       0x1 << 0;

static const int kPlayerTurnSegments    =       8;

@interface HACKAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
