//
//  PongScene.m
//  Pong
//
//  Created by Nicholas Wright on 7/29/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "PongScene.h"
#import "BallSprite.h"

@implementation PongScene

- (id)init {
	if ((self = [super init])) {
		[self addChild:[PongLayer node]];
	}
	return self;
}

@end

@implementation PongLayer

- (id)init {
	if((self = [super init])) {
        CCTexture2D *texture = [[CCTextureCache sharedTextureCache] addImage:@"ball.png"];

        ball = [BallSprite ballWithTexture:texture];
        [self addChild:ball];
        [self reset];
        
	}
	return self;
}

- (void)reset {
    CGSize size = [[CCDirector sharedDirector] winSize];
    [ball setPosition:ccp(size.width / 2, size.height / 2)];
}

@end
