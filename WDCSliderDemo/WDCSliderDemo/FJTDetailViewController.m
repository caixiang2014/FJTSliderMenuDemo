//
//  FJTDetailViewController.m
//  WDCSliderDemo
//
//  Created by fnst001 on 15-7-31.
//  Copyright (c) 2015年 FNST. All rights reserved.
//

#import "FJTDetailViewController.h"

@interface FJTDetailViewController ()

@end

@implementation FJTDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    UIImageView *menu = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Hamburger"]];
   
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showMenuBar)];
    [view addGestureRecognizer:tap];
    [view addSubview:menu];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showMenuBar
{
    
}
@end
