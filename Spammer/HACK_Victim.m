//
//  HACK_Victim.m
//  Spammer
//
//  Created by admin on 8/23/14.
//  Copyright (c) 2014 worldquest. All rights reserved.
//

#import "HACK_Victim.h"

@implementation HACK_Victim

+ (HACK_Victim *)initNewVictim:(SKScene *)whichScene startingPoint:(CGPoint)location;
{
    // initial frame
    SKTexture *f1 = nil;
    int r = rand() % 3;
    switch (r) {
        case 1:
            f1 = [SKTexture textureWithImageNamed: kVictim1FileName];
            break;
            
        case 2:
            f1 = [SKTexture textureWithImageNamed: kVictim2FileName];
            break;
            
        case 3:
            f1 = [SKTexture textureWithImageNamed: kVictim3FileName];
            break;
            
        default:
            break;
    }
    
    HACK_Victim *victim = [HACK_Victim spriteNodeWithTexture:f1];
    victim.name = @"victim";
    victim.position = location;
    //victim.xScale = 0.6;
    //victim.yScale = 0.6;
    
    // physics
    victim.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:victim.size];
    victim.physicsBody.categoryBitMask = kVictimCategory;
    victim.physicsBody.contactTestBitMask = kEmailCategory;
    victim.physicsBody.collisionBitMask = kEmailCategory ;
    victim.physicsBody.affectedByGravity = NO;
    victim.physicsBody.allowsRotation = YES;
    
    
    // add the sprite to the scene
    [whichScene addChild:victim];
    
    return victim;
}

- (void)spawnedInScene:(SKScene *)whichScene
{
    
}

@end
