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
    
    //   left, running
    f1 = [SKTexture textureWithImageNamed:kPlayerRunLeft1FileName];
    f2 = [SKTexture textureWithImageNamed:kPlayerRunLeft2FileName];
    f3 = [SKTexture textureWithImageNamed:kPlayerRunLeft3FileName];
    f4 = [SKTexture textureWithImageNamed:kPlayerRunLeft4FileName];
    f5 = [SKTexture textureWithImageNamed:kPlayerRunLeft5FileName];
    f6 = [SKTexture textureWithImageNamed:kPlayerRunLeft6FileName];
    f7 = [SKTexture textureWithImageNamed:kPlayerRunLeft7FileName];
    f8 = [SKTexture textureWithImageNamed:kPlayerRunLeft8FileName];
    _playerRunLeftTextures = @[f1,f2,f3,f4,f5,f6,f7,f8];
    
    //   up, running
    f1 = [SKTexture textureWithImageNamed:kPlayerRunUp1FileName];
    f2 = [SKTexture textureWithImageNamed:kPlayerRunUp2FileName];
    f3 = [SKTexture textureWithImageNamed:kPlayerRunUp3FileName];
    f4 = [SKTexture textureWithImageNamed:kPlayerRunUp4FileName];
    f5 = [SKTexture textureWithImageNamed:kPlayerRunUp5FileName];
    f6 = [SKTexture textureWithImageNamed:kPlayerRunUp6FileName];
    f7 = [SKTexture textureWithImageNamed:kPlayerRunUp7FileName];
    f8 = [SKTexture textureWithImageNamed:kPlayerRunUp8FileName];
    _playerRunUpTextures = @[f1,f2,f3,f4,f5,f6,f7,f8];
    
    //   down, running
    f1 = [SKTexture textureWithImageNamed:kPlayerRunDown1FileName];
    f2 = [SKTexture textureWithImageNamed:kPlayerRunDown2FileName];
    f3 = [SKTexture textureWithImageNamed:kPlayerRunDown3FileName];
    f4 = [SKTexture textureWithImageNamed:kPlayerRunDown4FileName];
    f5 = [SKTexture textureWithImageNamed:kPlayerRunDown5FileName];
    f6 = [SKTexture textureWithImageNamed:kPlayerRunDown6FileName];
    f7 = [SKTexture textureWithImageNamed:kPlayerRunDown7FileName];
    f8 = [SKTexture textureWithImageNamed:kPlayerRunDown8FileName];
    _playerRunDownTextures = @[f1,f2,f3,f4,f5,f6,f7,f8];
    
}

@end
