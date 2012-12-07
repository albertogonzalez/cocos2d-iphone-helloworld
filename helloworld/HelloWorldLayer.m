//
//  HelloWorldLayer.m
//  helloworld
//
//  Created by Alberto Gonzalez on 06/12/12.
//  Copyright albertogonzalez.net 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#define SPRITE_Z	1
#define SPRITE_TAG	1

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	layer.isTouchEnabled = YES;
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
		
		CCSprite *sprite = [CCSprite spriteWithFile:@"powered.png"];
		sprite.scale = 0.3;
		
/*		// position the sprite on the center of the screen
		sprite.position =  ccp( size.width /2 , size.height/2 );
		
		CCMoveTo *action = [CCMoveTo actionWithDuration:10 position:ccp(0,0)];
		[sprite runAction:action];
		CCBlink *blink = [CCBlink actionWithDuration:10 blinks:20];
		[sprite runAction:blink];
*/
		sprite.position =  ccp( 0 , size.height/2 );
/*
		CCMoveTo *move = [CCMoveTo actionWithDuration:5 position:ccp(size.width /2, sprite.position.y)];
		[sprite runAction:move];
		CCRotateBy *rot = [CCRotateBy actionWithDuration:5 angle:720];
		[sprite runAction:rot];
*/

		CCMoveTo *move = [CCMoveTo actionWithDuration:5 position:ccp(size.width /2, sprite.position.y)];
		CCRotateBy *rot = [CCRotateBy actionWithDuration:5 angle:720];
		CCBlink *blink = [CCBlink actionWithDuration:5 blinks:10];
		CCSpawn *entry = [CCSpawn actions:move, rot, nil];
		CCSequence *sequence = [CCSequence actions:entry, blink, nil];
		[sprite runAction:sequence];

		// add the sprite as a child to this Layer
		[self addChild: sprite z:SPRITE_Z tag:SPRITE_TAG];
		
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

//- (void) ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//- (void) ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//- (void) ccTouchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
- (void) ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch *touch = [touches anyObject];
	CGPoint touchLocation = [touch locationInView:touch.view];
	CGPoint touchLocationGL = [[CCDirector sharedDirector] convertToGL:touchLocation];
	
	CCSprite *sprite = (CCSprite*)[self getChildByTag:SPRITE_TAG];
	if (sprite) {
		[sprite stopAllActions];
		CCMoveTo *action = [CCMoveTo actionWithDuration:1 position:touchLocationGL];
		[sprite runAction:action];
	}
	
}


@end
