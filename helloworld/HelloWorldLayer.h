//
//  HelloWorldLayer.h
//  helloworld
//
//  Created by Alberto Gonzalez on 06/12/12.
//  Copyright albertogonzalez.net 2012. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
