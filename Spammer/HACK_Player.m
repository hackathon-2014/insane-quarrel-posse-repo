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
    //player.physicsBody.contactTestBitMask = kPlayerCategory;
    //player.physicsBody.collisionBitMask = kPlayerCategory ;
    player.physicsBody.linearDamping = 1.0;
    player.physicsBody.density = 1000.0;
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



- (void)rotateLeft
{
    switch (_currentDirection) {
        case HACK_PlayerDirectionE:
            _currentDirection = HACK_PlayerDirectionNE;
            [self runRight];
            break;
        case HACK_PlayerDirectionNE:
            _currentDirection = HACK_PlayerDirectionN;
            [self runUp];
            break;
        case HACK_PlayerDirectionN:
            _currentDirection = HACK_PlayerDirectionNW;
            [self runLeft];
            break;
        case HACK_PlayerDirectionNW:
            _currentDirection = HACK_PlayerDirectionW;
            [self runLeft];
            break;
        case HACK_PlayerDirectionW:
            _currentDirection = HACK_PlayerDirectionSW;
            [self runLeft];
            break;
        case HACK_PlayerDirectionSW:
            _currentDirection = HACK_PlayerDirectionS;
            [self runDown];
            break;
        case HACK_PlayerDirectionS:
            _currentDirection = HACK_PlayerDirectionSE;
            [self runRight];
            break;
        case HACK_PlayerDirectionSE:
            _currentDirection = HACK_PlayerDirectionE;
            [self runRight];
            break;
            
        default:
            break;
    }
}

- (void)rotateRight
{
    switch (_currentDirection) {
        case HACK_PlayerDirectionE:
            _currentDirection = HACK_PlayerDirectionSE;
            [self runRight];
            break;
        case HACK_PlayerDirectionSE:
            _currentDirection = HACK_PlayerDirectionS;
            [self runDown];
            break;
        case HACK_PlayerDirectionS:
            _currentDirection = HACK_PlayerDirectionSW;
            [self runLeft];
            break;
        case HACK_PlayerDirectionSW:
            _currentDirection = HACK_PlayerDirectionW;
            [self runLeft];
            break;
        case HACK_PlayerDirectionW:
            _currentDirection = HACK_PlayerDirectionNW;
            [self runLeft];
            break;
        case HACK_PlayerDirectionNW:
            _currentDirection = HACK_PlayerDirectionN;
            [self runUp];
            break;
        case HACK_PlayerDirectionN:
            _currentDirection = HACK_PlayerDirectionNE;
            [self runRight];
            break;
        case HACK_PlayerDirectionNE:
            _currentDirection = HACK_PlayerDirectionE;
            [self runRight];
            break;
            
        default:
            break;
    }
}

- (void)runRight
{
    NSLog(@"runRt...");
    [self removeAllActions];
    SKAction *runAnimation = [SKAction animateWithTextures:_spriteTextures.playerRunRightTextures timePerFrame:0.08];
    SKAction *runForever = [SKAction repeatActionForever:runAnimation];
    [self runAction:runForever];
}

- (void)runLeft
{
    NSLog(@"runLt...");
    [self removeAllActions];
    SKAction *runAnimation = [SKAction animateWithTextures:_spriteTextures.playerRunLeftTextures timePerFrame:0.08];
    SKAction *runForever = [SKAction repeatActionForever:runAnimation];
    [self runAction:runForever];
}

- (void)runUp
{
    NSLog(@"runUp...");
    [self removeAllActions];
    SKAction *runAnimation = [SKAction animateWithTextures:_spriteTextures.playerRunUpTextures timePerFrame:0.08];
    SKAction *runForever = [SKAction repeatActionForever:runAnimation];
    [self runAction:runForever];
}

- (void)runDown
{
    NSLog(@"runDn...");
    [self removeAllActions];
    SKAction *runAnimation = [SKAction animateWithTextures:_spriteTextures.playerRunDownTextures timePerFrame:0.08];
    SKAction *runForever = [SKAction repeatActionForever:runAnimation];
    [self runAction:runForever];
}

@end
