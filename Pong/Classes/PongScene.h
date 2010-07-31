//
//  PongScene.h
//  Pong
//
//  Created by Nicholas Wright on 7/29/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//
#import "cocos2d.h"


enum {
    kPlayerPaddle,
    kEnemyPaddle,
};

@class BallSprite;

@interface PongScene : CCScene {
    
}

@end


@interface PongLayer : CCLayer<CCTargetedTouchDelegate> {
    BallSprite *ball;
    BOOL fingerDown;
    CGPoint touchLocation;
}

- (void)reset;

@end
