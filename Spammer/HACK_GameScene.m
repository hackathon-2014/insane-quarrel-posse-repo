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

- (void)shootEmail
{
    HACK_Email *newEmail = nil;
    // forward impulse applied
    switch (_playerSprite.currentDirection) {
        case HACK_PlayerDirectionE:
            newEmail = [HACK_Email initNewEmail:self startingPoint:CGPointMake(CGRectGetMidX(self.frame)+20, CGRectGetMidY(self.frame))];
            [newEmail.physicsBody applyImpulse:CGVectorMake(10, 0)];
            break;
        case HACK_PlayerDirectionNE:
            newEmail = [HACK_Email initNewEmail:self startingPoint:CGPointMake(CGRectGetMidX(self.frame)+10, CGRectGetMidY(self.frame)+10)];
            [newEmail.physicsBody applyImpulse:CGVectorMake(10, 10)];
            break;
        case HACK_PlayerDirectionN:
            newEmail = [HACK_Email initNewEmail:self startingPoint:CGPointMake(CGRectGetMidX(self.frame)+0, CGRectGetMidY(self.frame)+20)];
            [newEmail.physicsBody applyImpulse:CGVectorMake(0, 10)];
            break;
        case HACK_PlayerDirectionNW:
            newEmail = [HACK_Email initNewEmail:self startingPoint:CGPointMake(CGRectGetMidX(self.frame)-10, CGRectGetMidY(self.frame)+10)];
            [newEmail.physicsBody applyImpulse:CGVectorMake(-10, 10)];
            break;
        case HACK_PlayerDirectionW:
            newEmail = [HACK_Email initNewEmail:self startingPoint:CGPointMake(CGRectGetMidX(self.frame)-20, CGRectGetMidY(self.frame)+0)];
            [newEmail.physicsBody applyImpulse:CGVectorMake(-10, 0)];
            break;
        case HACK_PlayerDirectionSW:
            newEmail = [HACK_Email initNewEmail:self startingPoint:CGPointMake(CGRectGetMidX(self.frame)-10, CGRectGetMidY(self.frame)-10)];
            [newEmail.physicsBody applyImpulse:CGVectorMake(-10, -10)];
            break;
        case HACK_PlayerDirectionS:
            newEmail = [HACK_Email initNewEmail:self startingPoint:CGPointMake(CGRectGetMidX(self.frame)+0, CGRectGetMidY(self.frame)-20)];
            [newEmail.physicsBody applyImpulse:CGVectorMake(0, -10)];
            break;
        case HACK_PlayerDirectionSE:
            newEmail = [HACK_Email initNewEmail:self startingPoint:CGPointMake(CGRectGetMidX(self.frame)+10, CGRectGetMidY(self.frame)-10)];
            [newEmail.physicsBody applyImpulse:CGVectorMake(10, -10)];
            break;
            
        default:
            break;
    }
}



#pragma mark Contact / Collision / Touches



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        if (location.y >= (self.frame.size.height / 2 )) {
            // user touched upper half of the screen (zero = bottom of screen)
            [self shootEmail];            
        } else if (location.x <= ( self.frame.size.width / 2 )) {
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
    
    //player direction cooresponds to static background scrolling
    switch (_playerSprite.currentDirection) {
        case HACK_PlayerDirectionE:
            _background.xScrollingSpeed = 4;
            _background.yScrollingSpeed = 0;
            break;
        case HACK_PlayerDirectionNE:
            _background.xScrollingSpeed = 4;
            _background.yScrollingSpeed = 4;
            break;
        case HACK_PlayerDirectionN:
            _background.xScrollingSpeed = 0;
            _background.yScrollingSpeed = 4;
            break;
        case HACK_PlayerDirectionNW:
            _background.xScrollingSpeed = -4;
            _background.yScrollingSpeed = 4;
            break;
        case HACK_PlayerDirectionW:
            _background.xScrollingSpeed = -4;
            _background.yScrollingSpeed = 0;
            break;
        case HACK_PlayerDirectionSW:
            _background.xScrollingSpeed = -4;
            _background.yScrollingSpeed = -4;
            break;
        case HACK_PlayerDirectionS:
            _background.xScrollingSpeed = 0;
            _background.yScrollingSpeed = -4;
            break;
        case HACK_PlayerDirectionSE:
            _background.xScrollingSpeed = 4;
            _background.yScrollingSpeed = -4;
            break;
            
        default:
            break;
    }
}

@end
