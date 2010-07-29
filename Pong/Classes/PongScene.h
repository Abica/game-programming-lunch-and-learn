//
//  PongScene.h
//  Pong
//
//  Created by Nicholas Wright on 7/29/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//
#import "cocos2d.h"

@class BallSprite;

@interface PongScene : CCScene {
    
}

@end


@interface PongLayer : CCLayer {
    BallSprite *ball;
}

- (void)reset;

@end
