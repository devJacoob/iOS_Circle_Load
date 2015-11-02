//
//  CircleLoaderView.h
//  Circle_Load
//
//  Created by 張家豪 on 2015/11/2.
//  Copyright © 2015年 Jacob.Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleLoaderView : UIView

#define LINE_WIDTH 3.0f // maybe change a little ...
#define RADIUS self.frame.size.width/6 //Recommended only modify this value(8) up or down.

-(void)animationStop;


@end
