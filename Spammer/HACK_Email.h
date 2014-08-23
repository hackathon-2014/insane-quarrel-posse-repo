//
//  HACK_Email.h
//  Spammer
//
//  Created by admin on 8/23/14.
//  Copyright (c) 2014 worldquest. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "HACKAppDelegate.h"
#import "HACK_Textures.h"

@interface HACK_Email : SKSpriteNode

+ (HACK_Email *)initNewEmail:(SKScene *)whichScene startingPoint:(CGPoint)location;

@end
