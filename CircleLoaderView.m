//
//  CircleLoaderView.m
//  Circle_Load
//
//  Created by 張家豪 on 2015/11/2.
//  Copyright © 2015年 Jacob.Zhang. All rights reserved.
//

#import "CircleLoaderView.h"

// you need Foundation, UIKit, QuartzCore, CoreGraphics ...Frameworks

#import <QuartzCore/QuartzCore.h>
#import <CoreGraphics/CoreGraphics.h>

@interface CircleLoaderView ()

@property (strong, nonatomic) CAShapeLayer *myLayer;


@end


@implementation CircleLoaderView

-(id) initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if(!self) return nil;
    
    self.backgroundColor = [UIColor clearColor];
    [self setMyShapeLayer];
    [self actionSpin];
    
    
    float labelFrameRef = RADIUS+10;
    UILabel *label = [[UILabel alloc]init];
    label.frame = CGRectMake(self.frame.size.width/2-(labelFrameRef/2), self.frame.size.height/2-(labelFrameRef/2), labelFrameRef, labelFrameRef);
    label.text = @"Loading";
    label.font = [UIFont systemFontOfSize:labelFrameRef/4];
    label.textColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    
    return self;
}

#pragma mark -> set layer_frame

- (void)drawRect:(CGRect)rect {
    _myLayer.frame = self.bounds;
}

#pragma mark -> Shape Set

-(void)setMyShapeLayer{
    _myLayer = [CAShapeLayer layer];
    _myLayer.strokeColor = [UIColor redColor].CGColor;
    _myLayer.fillColor = [UIColor clearColor].CGColor;
    _myLayer.lineCap = kCALineCapRound;
    _myLayer.lineWidth = LINE_WIDTH;
    [self.layer addSublayer:_myLayer];
    
    
}

#pragma mark -> draw circle

-(void)drawCircle{
    UIBezierPath *processPath = [UIBezierPath bezierPath];
    processPath.lineWidth = LINE_WIDTH;
    
    CGFloat start = -(M_PI /2);
    CGFloat end = (1.8f * M_PI) + start;
    CGPoint center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    CGFloat radius = RADIUS;
    [processPath addArcWithCenter:center radius:radius startAngle:start endAngle:end clockwise:YES];
    _myLayer.path = processPath.CGPath;
    
}

#pragma mark -> spin Action

-(void)actionSpin{
    
    [self drawCircle];
    CABasicAnimation *caAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    caAnimation.toValue = [NSNumber numberWithFloat:M_PI*2];
    caAnimation.duration = 1.0f;
    caAnimation.cumulative = YES;
    caAnimation.repeatCount = HUGE_VALF;
    [_myLayer addAnimation:caAnimation forKey:nil];
}

#pragma mark -> stop Animation

-(void)animationStop{
    [_myLayer removeAllAnimations];
    [self removeFromSuperview];
}




@end
