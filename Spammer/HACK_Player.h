//
//  HACK_Player.h
//  Spammer
//
//  Created by admin on 8/23/14.
//  Copyright (c) 2014 worldquest. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "HACKAppDelegate.h"
#import "HACK_Textures.h"

@interface HACK_Player : SKSpriteNode

@property (nonatomic, strong) HACK_Textures *spriteTextures;

+ (HACK_Player *)initNewPlayer:(SKScene *)whichScene startingPoint:(CGPoint)location;
- (void)spawnedInScene:(SKScene *)whichScene;

- (void)rotateLeft;
- (void)rotateRight;
- (void)runRight;

@end
