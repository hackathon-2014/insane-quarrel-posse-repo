//
//  HACK_SplashScene.m
//  Spammer
//
//  Created by admin on 8/23/14.
//  Copyright (c) 2014 worldquest. All rights reserved.
//

#import "HACK_SplashScene.h"
#import "HACK_GameScene.h"

@implementation HACK_SplashScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.backgroundColor = [SKColor blackColor];
        
        NSString *fileName = @"Splash";
        SKSpriteNode *splash = [SKSpriteNode spriteNodeWithImageNamed:fileName];
        splash.name = @"splashNode";
        splash.anchorPoint = CGPointMake(0, 0);
        [self addChild:splash];
        
        SKLabelNode *myText = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myText.text = @"Press To Start";
        myText.name = @"startNode";
        myText.fontSize = 30;
        myText.position = CGPointMake(CGRectGetMidX(self.frame),
                                      CGRectGetMidY(self.frame)-100);
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        SKNode *instructionNode = [self childNodeWithName:@"instructionNode"];
        
        if (instructionNode != nil) {
            // second tap - on to the game
            
            // remove instruction sheet
            [instructionNode removeFromParent];
            
            // transition to game scene
            SKNode *splashNode = [self childNodeWithName:@"splashNode"];
            SKNode *startNode = [self childNodeWithName:@"startNode"];
            if (splashNode != nil) {
                splashNode.name = nil;
                SKAction *zoom = [SKAction scaleTo: 4.0 duration: 1];
                SKAction *fadeAway = [SKAction fadeOutWithDuration: 1];
                SKAction *grouped = [SKAction group:@[zoom, fadeAway]];
                [startNode runAction:grouped];
                [splashNode runAction: grouped completion:^{
                    HACK_GameScene *nextScene  = [[HACK_GameScene alloc] initWithSize:self.size];
                    SKTransition *doors = [SKTransition doorwayWithDuration:0.5];
                    [self.view presentScene:nextScene transition:doors];
                }];
            }
        } else if (location.x < -1000) {
            //bogus entry to remove warning
        } else {
            // first tap - show instructions
            
            SKSpriteNode *instruction = [SKSpriteNode spriteNodeWithImageNamed:@"Instructions"];
            instruction.name = @"instructionNode";
            instruction.anchorPoint = CGPointMake(0.5, 0.5);
            instruction.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
            [self addChild:instruction];
        }
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
