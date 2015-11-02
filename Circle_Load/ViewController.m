//
//  ViewController.m
//  Circle_Load
//
//  Created by 張家豪 on 2015/10/29.
//  Copyright © 2015年 Jacob.Zhang. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    drawObj = [[CircleLoaderView alloc]initWithFrame:self.view.frame];
    
    [self.view addSubview:drawObj];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-150, self.view.frame.size.width, 100)];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"endAnimation" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    
}
#pragma mark -> remove loader
//________________________________________________________________
-(void)click{
    [drawObj animationStop]; // call this function to remove loader
}
//________________________________________________________________


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
