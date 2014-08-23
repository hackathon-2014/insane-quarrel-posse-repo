//
//  HACK_GameScene.h
//  Spammer
//
//  Created by admin on 8/23/14.
//  Copyright (c) 2014 worldquest. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "HACKAppDelegate.h"
#import "HACK_ScrollingNode.h"
#import "HACK_Player.h"

@interface HACK_GameScene : SKScene <SKPhysicsContactDelegate>

@property (strong, nonatomic) HACK_Player *playerSprite;
@property (strong, nonatomic) HACK_Textures *spriteTextures;

@property (strong, nonatomic) HACK_ScrollingNode *back;

@end
