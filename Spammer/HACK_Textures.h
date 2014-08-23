//
//  HACK_Textures.h
//  Spammer
//
//  Created by admin on 8/23/14.
//  Copyright (c) 2014 worldquest. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

#define kPlayerRunRight1FileName             @"Player-R-1.png"
#define kPlayerRunRight2FileName             @"Player-R-2.png"
#define kPlayerRunRight3FileName             @"Player-R-3.png"
#define kPlayerRunRight4FileName             @"Player-R-4.png"
#define kPlayerRunRight5FileName             @"Player-R-5.png"
#define kPlayerRunRight6FileName             @"Player-R-6.png"
#define kPlayerRunRight7FileName             @"Player-R-7.png"
#define kPlayerRunRight8FileName             @"Player-R-8.png"

#define kPlayerRunLeft1FileName              @"Player-L-1.png"
#define kPlayerRunLeft2FileName              @"Player-L-2.png"
#define kPlayerRunLeft3FileName              @"Player-L-3.png"
#define kPlayerRunLeft4FileName              @"Player-L-4.png"
#define kPlayerRunLeft5FileName              @"Player-L-5.png"
#define kPlayerRunLeft6FileName              @"Player-L-6.png"
#define kPlayerRunLeft7FileName              @"Player-L-7.png"
#define kPlayerRunLeft8FileName              @"Player-L-8.png"

#define kPlayerRunUp1FileName                @"Player-U-1.png"
#define kPlayerRunUp2FileName                @"Player-U-2.png"
#define kPlayerRunUp3FileName                @"Player-U-3.png"
#define kPlayerRunUp4FileName                @"Player-U-4.png"
#define kPlayerRunUp5FileName                @"Player-U-5.png"
#define kPlayerRunUp6FileName                @"Player-U-6.png"
#define kPlayerRunUp7FileName                @"Player-U-7.png"
#define kPlayerRunUp8FileName                @"Player-U-8.png"

#define kPlayerRunDown1FileName              @"Player-D-1.png"
#define kPlayerRunDown2FileName              @"Player-D-2.png"
#define kPlayerRunDown3FileName              @"Player-D-3.png"
#define kPlayerRunDown4FileName              @"Player-D-4.png"
#define kPlayerRunDown5FileName              @"Player-D-5.png"
#define kPlayerRunDown6FileName              @"Player-D-6.png"
#define kPlayerRunDown7FileName              @"Player-D-7.png"
#define kPlayerRunDown8FileName              @"Player-D-8.png"

@interface HACK_Textures : NSObject

@property (nonatomic, strong) NSArray *playerRunRightTextures;
@property (nonatomic, strong) NSArray *playerRunLeftTextures;
@property (nonatomic, strong) NSArray *playerRunUpTextures;
@property (nonatomic, strong) NSArray *playerRunDownTextures;

- (void)createAnimationTextures;

@end
