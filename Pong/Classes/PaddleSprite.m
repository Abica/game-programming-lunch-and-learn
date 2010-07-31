//
//  PaddleSprite.m
//  Pong
//
//  Created by Nicholas Wright on 7/30/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PaddleSprite.h"

@implementation PaddleSprite

+ (id)paddleWithTexture:(CCTexture2D *)aTexture {
	return [[[self alloc] initWithTexture:aTexture] autorelease];
}

- (id)initWithTexture:(CCTexture2D *)aTexture {
	if ((self = [super initWithTexture:aTexture]) ) {
        speed = 4;
    }
	
	return self;
}

- (void)moveUp {
    [self setPosition:ccp(self.position.x, self.position.y + speed)];

    CGSize size = [[CCDirector sharedDirector] winSize];
    int paddleCenter = [self contentSize].height / 2;
    if (self.position.y - paddleCenter > size.height) {
        [self setPosition:ccp(self.position.x, size.height - paddleCenter)];
    }
}

- (void)moveDown {
    int paddleCenter = [self contentSize].height / 2;
    [self setPosition:ccp(self.position.x, self.position.y - speed)];

    if (self.position.y + paddleCenter < 0) {
        [self setPosition:ccp(self.position.x, paddleCenter)];
    }
}

@end
