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
    _background = [HACK_ScrollingNode scrollingNodeWithImageNamed:@"background" inContainerWidth:self.frame.size.width inContainerHeight:self.frame.size.height];
    _background.xScrollingSpeed = 4;
    _background.yScrollingSpeed = 0;
    [self addChild:_background];
    
    // Player
    _playerSprite = [HACK_Player initNewPlayer:self startingPoint:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
    [_playerSprite spawnedInScene:self];
    [_playerSprite runRight];
}



#pragma mark Contact / Collision / Touches



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        if (location.x <= ( self.frame.size.width / 2 )) {
            // user touched left side of screen
            [_playerSprite rotateLeft];
        } else {
            // user touched right side of screen
            [_playerSprite rotateRight];
        }
    }
}

-(void)update:(CFTimeInterval)currentTime {
    // scrolling background
    [_background update:currentTime];
    
    //rotating player
    NSLog(@"r:%f", _playerSprite.zRotation);
    if (_playerSprite.zRotation > -0.5 && _playerSprite.zRotation < 0.5) {
        _background.xScrollingSpeed = 4;
        _background.yScrollingSpeed = 0;
    } else if (_playerSprite.zRotation > 0.5 && _playerSprite.zRotation < 1.0) {
        _background.xScrollingSpeed = 4;
        _background.yScrollingSpeed = 4;
    } else if (_playerSprite.zRotation > 1 && _playerSprite.zRotation < 2) {
        _background.xScrollingSpeed = 0;
        _background.yScrollingSpeed = 4;
    } else if (_playerSprite.zRotation > 2.0 && _playerSprite.zRotation < 2.5) {
        _background.xScrollingSpeed = -4;
        _background.yScrollingSpeed = 4;
    } else if (_playerSprite.zRotation > -3.5 && _playerSprite.zRotation < -3) {
        _background.xScrollingSpeed = -4;
        _background.yScrollingSpeed = 0;
    } else if (_playerSprite.zRotation > -2.5 && _playerSprite.zRotation < -2.0) {
        _background.xScrollingSpeed = -4;
        _background.yScrollingSpeed = -4;
    } else if (_playerSprite.zRotation > -2 && _playerSprite.zRotation < -1) {
        _background.xScrollingSpeed = 0;
        _background.yScrollingSpeed = -4;
    } else if (_playerSprite.zRotation > -1.0 && _playerSprite.zRotation < -0.5) {
        _background.xScrollingSpeed = 4;
        _background.yScrollingSpeed = -4;
    }
}

@end
