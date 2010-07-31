//
//  PongScene.m
//  Pong
//
//  Created by Nicholas Wright on 7/29/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "PongScene.h"
#import "PaddleSprite.h"
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
        
        CCTexture2D *paddleTexture = [[CCTextureCache sharedTextureCache] addImage:@"paddle.png"];

        PaddleSprite *paddle = [PaddleSprite paddleWithTexture:paddleTexture];
        [self addChild:paddle z:2 tag:kPlayerPaddle];
                
        PaddleSprite *enemy = [PaddleSprite paddleWithTexture:paddleTexture];
        [self addChild:enemy z:2 tag:kEnemyPaddle];
	
        [self reset];
        [self schedule:@selector(move)];
    }
	return self;
}

- (void)reset {
    fingerDown = NO;
    
    CGSize size = [[CCDirector sharedDirector] winSize];
    ball.scale = 0.5f;
    [ball setPosition:ccp(size.width / 2, size.height / 2)];

    PaddleSprite *paddle = (PaddleSprite *)[self getChildByTag:kPlayerPaddle];
    paddle.scale = 2.5f;
    [paddle setPosition:ccp([paddle contentSize].width * 2, size.height / 2)];
    
    PaddleSprite *enemy = (PaddleSprite *)[self getChildByTag:kEnemyPaddle];
    enemy.scale = 2.5f;

    [enemy setPosition:ccp(size.width - [paddle contentSize].width * 2, size.height / 2)];

}

- (void)move {
    PaddleSprite *paddle = (PaddleSprite *)[self getChildByTag:kPlayerPaddle];
    CCLOG(@"HERE");
    
    if (fingerDown) {
        if (paddle.position.y < touchLocation.y) {
            [paddle moveUp];
        } else {
            [paddle moveDown];
        }
    }
    
//    PaddleSprite *enemy = (PaddleSprite *)[self getChildByTag:kEnemyPaddle];
    
    [ball move];
}

- (void)onEnter {
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
    [super onEnter];
}

- (void)onExit {
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];

    [self unschedule:@selector(move)];
    [super onExit];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    CCLOG(@"JUST TOUCHED");
    CGPoint start = [touch locationInView:[touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL:start];
    fingerDown = YES;
    return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    CCLOG(@"TOUCH MOVED");
    CGPoint start = [touch locationInView:[touch view]];
    touchLocation = [[CCDirector sharedDirector] convertToGL:start];
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
    CCLOG(@"TOUCH ENDED");
    fingerDown = NO;
}

- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event {
    CCLOG(@"TOUCH CANCELLED");
    fingerDown = NO;
}

@end
