//
//  HACK_Victim.h
//  Spammer
//
//  Created by admin on 8/23/14.
//  Copyright (c) 2014 worldquest. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "HACKAppDelegate.h"
#import "HACK_Textures.h"

@interface HACK_Victim : SKSpriteNode

+ (HACK_Victim *)initNewVictim:(SKScene *)whichScene startingPoint:(CGPoint)location;
- (void)spawnedInScene:(SKScene *)whichScene;

@end
