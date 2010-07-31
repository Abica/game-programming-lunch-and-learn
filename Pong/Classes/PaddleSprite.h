//
//  PaddleSprite.h
//  Pong
//
//  Created by Nicholas Wright on 7/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface PaddleSprite : CCSprite {
    int speed;
}

+ (id)paddleWithTexture:(CCTexture2D *)aTexture;
- (void)moveDown;
- (void)moveUp;

@end
