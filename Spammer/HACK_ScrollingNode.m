//
//  HACK_ScrollingNode.m
//  Spammer
//
//  Created by admin on 8/23/14.
//  Copyright (c) 2014 worldquest. All rights reserved.
//

#import "HACK_ScrollingNode.h"

@implementation HACK_ScrollingNode

+ (id) scrollingNodeWithImageNamed:(NSString *)name inContainerWidth:(float) width  inContainerHeight:(float) height
{
    UIImage * image = [UIImage imageNamed:name];
    
    HACK_ScrollingNode * realNode = [HACK_ScrollingNode spriteNodeWithColor:[UIColor clearColor] size:CGSizeMake(width, height)];
    realNode.xScrollingSpeed = 1;
    realNode.yScrollingSpeed = 1;
    
    float xTotal = 0;
    int xCount = 0;
    while(xTotal<(width + image.size.width)){
        SKSpriteNode * child = [SKSpriteNode spriteNodeWithImageNamed:name ];
        child.name = @"background";
        [child setAnchorPoint:CGPointZero];
        [child setPosition:CGPointMake(xTotal, 0)];
        [realNode addChild:child];
        xTotal+=child.size.width;
        xCount+=1;
        NSLog(@"x - %@", child.name);
    }
    xTotal = 0;
    int yCount = 0;
    while(yCount<xCount){
        SKSpriteNode * child = [SKSpriteNode spriteNodeWithImageNamed:name ];
        child.name = @"background";
        [child setAnchorPoint:CGPointZero];
        [child setPosition:CGPointMake(xTotal, image.size.height)];
        [realNode addChild:child];
        xTotal+=child.size.width;
        yCount+=1;
        NSLog(@"y - %@", child.name);
    }
    
    return realNode;
}

- (void) update:(NSTimeInterval)currentTime
{
    [self enumerateChildNodesWithName:@"background" usingBlock:^(SKNode *node, BOOL *stop) {
        *stop = NO;
        HACK_ScrollingNode *child = (HACK_ScrollingNode *)node;
        child.position = CGPointMake(child.position.x-_xScrollingSpeed, child.position.y-_yScrollingSpeed);
        if ((child.position.x <= -child.size.width) && (_xScrollingSpeed > 0)){
            float delta = child.position.x+child.size.width;
            child.position = CGPointMake(child.size.width+delta, child.position.y);
            //NSLog(@"move rt - repositioned X for %@", child.name);
        }
        if ((child.position.y <= -child.size.height) && (_yScrollingSpeed > 0)){
            float delta = child.position.y+child.size.height;
            child.position = CGPointMake(child.position.x, child.size.height+delta);
            //NSLog(@"move up - repositioned Y for %@", child.name);
        }
        if ((child.position.x >= child.size.width) && (_xScrollingSpeed < 0)){
            float delta = child.position.x+child.size.width;
            child.position = CGPointMake(child.size.width-delta, child.position.y);
            //NSLog(@"move lt - repositioned X for %@", child.name);
        }
        if ((child.position.y >= child.size.height) && (_yScrollingSpeed < 0)){
            float delta = child.position.y+child.size.height;
            child.position = CGPointMake(child.position.x, child.size.height-delta+10);
            //NSLog(@"move down - repositioned Y for %@", child.name);
        }
    }];
}

@end
