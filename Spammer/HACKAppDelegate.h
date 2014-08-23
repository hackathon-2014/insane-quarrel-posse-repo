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
static const uint32_t kEmailCategory    =       0x1 << 1;

static const int kPlayerTurnSegments    =       8;

typedef enum : uint8_t {
    HACK_PlayerDirectionE = 0,
    HACK_PlayerDirectionSE,
    HACK_PlayerDirectionS,
    HACK_PlayerDirectionSW,
    HACK_PlayerDirectionW,
    HACK_PlayerDirectionNW,
    HACK_PlayerDirectionN,
    HACK_PlayerDirectionNE
} HACK_PlayerDirections;

@interface HACKAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@end
