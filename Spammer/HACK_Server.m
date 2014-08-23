//
//  HACK_Server.m
//  Spammer
//
//  Created by admin on 8/23/14.
//  Copyright (c) 2014 worldquest. All rights reserved.
//

#import "HACK_Server.h"

@implementation HACK_Server

+ (HACK_Server *)initNewServer:(SKScene *)whichScene startingPoint:(CGPoint)location;
{
    // initial frame
    SKTexture *f1 = [SKTexture textureWithImageNamed: kServerFileName];
    
    HACK_Server *server = [HACK_Server spriteNodeWithTexture:f1];
    server.name = @"server";
    server.position = location;
    server.xScale = 0.6;
    server.yScale = 0.6;
    
    // physics
    server.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:server.size];
    server.physicsBody.categoryBitMask = kServerCategory;
    server.physicsBody.contactTestBitMask = kEmailCategory;
    server.physicsBody.collisionBitMask = kEmailCategory ;
    server.physicsBody.affectedByGravity = NO;
    server.physicsBody.allowsRotation = YES;
    
    
    // add the sprite to the scene
    [whichScene addChild:server];
    
    return server;
}

- (void)spawnedInScene:(SKScene *)whichScene
{

}

@end
