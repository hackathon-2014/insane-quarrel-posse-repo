//
//  HACK_Textures.m
//  Spammer
//
//  Created by admin on 8/23/14.
//  Copyright (c) 2014 worldquest. All rights reserved.
//

#import "HACK_Textures.h"

@implementation HACK_Textures

- (void)createAnimationTextures
{
    // animation arrays
    
    
    // Player
    
    //   right, running
    SKTexture *f1 = [SKTexture textureWithImageNamed:kPlayerRunRight1FileName];
    SKTexture *f2 = [SKTexture textureWithImageNamed:kPlayerRunRight2FileName];
    SKTexture *f3 = [SKTexture textureWithImageNamed:kPlayerRunRight3FileName];
    SKTexture *f4 = [SKTexture textureWithImageNamed:kPlayerRunRight4FileName];
    SKTexture *f5 = [SKTexture textureWithImageNamed:kPlayerRunRight1FileName];
    SKTexture *f6 = [SKTexture textureWithImageNamed:kPlayerRunRight2FileName];
    SKTexture *f7 = [SKTexture textureWithImageNamed:kPlayerRunRight3FileName];
    SKTexture *f8 = [SKTexture textureWithImageNamed:kPlayerRunRight4FileName];
    _playerRunRightTextures = @[f1,f2,f3,f4,f5,f6,f7,f8];
    
}

@end
