//
//  HACK_GameScene.m
//  Spammer
//
//  Created by admin on 8/23/14.
//  Copyright (c) 2014 worldquest. All rights reserved.
//

#import "HACK_GameScene.h"

@implementation HACK_GameScene

#pragma mark Initialization



-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.backgroundColor = [SKColor blackColor];
        self.physicsWorld.contactDelegate = self;
        
        // initialize and create our sprite textures
        _spriteTextures = [[HACK_Textures alloc] init];
        [_spriteTextures createAnimationTextures];
        
        // add contents to game screen
        [self createSceneContents];

    }
    return self;
}



#pragma mark Scene creation



- (void)createSceneContents
{
    // Background
    _back = [HACK_ScrollingNode scrollingNodeWithImageNamed:@"background" inContainerWidth:self.frame.size.width inContainerHeight:self.frame.size.height];
    _back.xScrollingSpeed = 4;
    _back.yScrollingSpeed = 0;
    [self addChild:_back];
    
    // Player
    _playerSprite = [HACK_Player initNewPlayer:self startingPoint:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
    [_playerSprite spawnedInScene:self];
    [_playerSprite runRight];
    //    _playerLivesRemaining = kPlayerLivesMax;
    //    _playerIsDeadFlag = NO;
    //    [self playerLivesDisplay];
}

-(void)update:(CFTimeInterval)currentTime {
    [_back update:currentTime];
}

@end
