//
//  main.m
//  Pong
//
//  Created by Nicholas Wright on 7/29/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

int main(int argc, char *argv[]) {
	NSAutoreleasePool *pool = [NSAutoreleasePool new];
	int retVal = UIApplicationMain(argc, argv, nil, @"PongAppDelegate");
	[pool release];
	return retVal;
}
