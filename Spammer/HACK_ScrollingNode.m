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
        [child setAnchorPoint:CGPointZero];
        [child setPosition:CGPointMake(xTotal, 0)];
        [realNode addChild:child];
        xTotal+=child.size.width;
        xCount+=1;
        NSLog(@"x - NewChild");
    }
    xTotal = 0;
    int yCount = 0;
    while(yCount<xCount){
        SKSpriteNode * child = [SKSpriteNode spriteNodeWithImageNamed:name ];
        [child setAnchorPoint:CGPointZero];
        [child setPosition:CGPointMake(xTotal, image.size.height)];
        [realNode addChild:child];
        xTotal+=child.size.width;
        yCount+=1;
        NSLog(@"y - NewChild");
    }
    
//    SKSpriteNode * child = [SKSpriteNode spriteNodeWithImageNamed:name ];
//    [child setAnchorPoint:CGPointZero];
//    [child setPosition:CGPointMake(0, 0)];
//    [realNode addChild:child];
    
    return realNode;
}

- (void) update:(NSTimeInterval)currentTime
{
    [self.children enumerateObjectsUsingBlock:^(SKSpriteNode * child, NSUInteger idx, BOOL *stop) {
        child.position = CGPointMake(child.position.x-self.xScrollingSpeed, child.position.y-self.yScrollingSpeed);
        if (child.position.x <= -child.size.width){
            float delta = child.position.x+child.size.width;
            child.position = CGPointMake(child.size.width*(self.children.count-3)+delta, child.position.y);
        }
        if (child.position.y <= -child.size.height){
            float delta = child.position.y+child.size.height;
            child.position = CGPointMake(child.position.x, child.size.height*(self.children.count-3)+delta);
        }
    }];
}

@end
