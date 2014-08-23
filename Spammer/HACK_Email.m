//
//  HACK_Email.m
//  Spammer
//
//  Created by admin on 8/23/14.
//  Copyright (c) 2014 worldquest. All rights reserved.
//

#import "HACK_Email.h"
#import "HACK_GameScene.h"

@implementation HACK_Email



#pragma mark Initialization



+ (HACK_Email *)initNewEmail:(SKScene *)whichScene startingPoint:(CGPoint)location;
{
    // initial frame
    SKTexture *f1 = [SKTexture textureWithImageNamed: kEmailFileName];
    
    HACK_Email *email = [HACK_Email spriteNodeWithTexture:f1];
    email.name = @"email";
    email.position = location;
    email.xScale = 0.6;
    email.yScale = 0.6;
    
    SKAction *spin = [SKAction rotateByAngle:((2*M_PI)/8) duration:0.04];
    SKAction *spinForever = [SKAction repeatActionForever:spin];
    [email runAction:spinForever];
    
    // physics
    email.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:email.size];
    email.physicsBody.categoryBitMask = kEmailCategory;
    //email.physicsBody.contactTestBitMask = kPlayerCategory;
    //email.physicsBody.collisionBitMask = kPlayerCategory ;
    email.physicsBody.affectedByGravity = NO;
    email.physicsBody.allowsRotation = YES;
    
    
    // add the sprite to the scene
    [whichScene addChild:email];
    
    return email;
}

@end
