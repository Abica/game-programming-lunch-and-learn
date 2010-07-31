//
//  BallSprite.m
//  Pong
//
//  Created by Nicholas Wright on 7/29/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BallSprite.h"


@implementation BallSprite

+ (id)ballWithTexture:(CCTexture2D *)aTexture {
	return [[[self alloc] initWithTexture:aTexture] autorelease];
}

- (id)initWithTexture:(CCTexture2D *)aTexture {
	if ((self = [super initWithTexture:aTexture]) ) {
        dx = 2;
        dy = 2;
	}
	
	return self;
}

- (void)move {
    CCLOG(@"MOVING BALL");
    CGSize size = [[CCDirector sharedDirector] winSize];
    int ballCenter = [self contentSize].width / 2;
    if ((self.position.y + ballCenter > size.height) ||
        (self.position.y - ballCenter < 0)) {
        dy *= -1;
    } 
    
    if ((self.position.x + ballCenter > size.width) ||
        (self.position.x - ballCenter < 0)) {      
        dx *= -1;
    }
    [self setPosition:ccp(self.position.x + dx, self.position.y + dy)];
}

@end
