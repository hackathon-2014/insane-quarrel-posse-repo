//
//  HACK_ScrollingNode.h
//  Spammer
//
//  Created by admin on 8/23/14.
//  Copyright (c) 2014 worldquest. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface HACK_ScrollingNode : SKSpriteNode

@property (nonatomic) CGFloat xScrollingSpeed, yScrollingSpeed;

+ (id) scrollingNodeWithImageNamed:(NSString *)name inContainerWidth:(float) width  inContainerHeight:(float) height;
- (void) update:(NSTimeInterval)currentTime;


@end
