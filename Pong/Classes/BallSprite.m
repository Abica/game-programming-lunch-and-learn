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
        dx = 5;
        dy = 5;
	}
	
	return self;
}

@end
