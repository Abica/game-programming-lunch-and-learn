//
//  BallSprite.h
//  Pong
//
//  Created by Nicholas Wright on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface BallSprite : CCSprite {
    int dx;
    int dy;
}

+ (id)ballWithTexture:(CCTexture2D *)aTexture;

@end
