//
//  HACK_Player.m
//  Spammer
//
//  Created by admin on 8/23/14.
//  Copyright (c) 2014 worldquest. All rights reserved.
//

#import "HACK_Player.h"
#import "HACK_GameScene.h"

@implementation HACK_Player



#pragma mark Initialization



+ (HACK_Player *)initNewPlayer:(SKScene *)whichScene startingPoint:(CGPoint)location;
{
    // initial frame
    SKTexture *f1 = [SKTexture textureWithImageNamed: kPlayerRunRight1FileName];
    
    // our player character sprite & starting position in the scene
    HACK_Player *player = [HACK_Player spriteNodeWithTexture:f1];
    player.name = @"player";
    player.position = location;
    
    // physics
    player.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:player.size];
    player.physicsBody.categoryBitMask = kPlayerCategory;
    player.physicsBody.contactTestBitMask = kPlayerCategory;
    player.physicsBody.collisionBitMask = kPlayerCategory ;
    player.physicsBody.affectedByGravity = NO;
    player.physicsBody.allowsRotation = YES;
    
    // add the sprite to the scene
    [whichScene addChild:player];
    
    return player;
}

- (void)spawnedInScene:(SKScene *)whichScene
{
    HACK_GameScene *theScene = (HACK_GameScene *)whichScene;
    _spriteTextures = theScene.spriteTextures;
    
    // Sounds

    
    // Play sound
    //[self runAction:_spawnSound];
}



#pragma mark Movement



- (void)runRight
{
    NSLog(@"run Right");
    
    SKAction *runAnimation = [SKAction animateWithTextures:_spriteTextures.playerRunRightTextures timePerFrame:0.08];
    SKAction *runForever = [SKAction repeatActionForever:runAnimation];
    [self runAction:runForever];
}

@end
