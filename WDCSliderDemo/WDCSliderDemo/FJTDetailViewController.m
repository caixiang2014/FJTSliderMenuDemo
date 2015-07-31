//
//  FJTDetailViewController.m
//  WDCSliderDemo
//
//  Created by fnst001 on 15-7-31.
//  Copyright (c) 2015年 FNST. All rights reserved.
//

#import "FJTDetailViewController.h"
#import "FJTItem.h"
@interface FJTDetailViewController ()
@property (nonatomic,strong) UIImageView *bigImage;
@end

@implementation FJTDetailViewController

- (UIImageView *)bigImage {
    if (!_bigImage) {
        UIImageView *bigImage = [[UIImageView alloc] init];
        _bigImage = bigImage;
        [self.view addSubview:bigImage];
    }
    return _bigImage;
}
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
    self.leftBarButtonClick();
}
//由于init的时候有时候不是获取的真正的frame
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.bigImage.frame = CGRectMake((CGRectGetWidth(self.view.bounds) - 320) * 0.5, (CGRectGetHeight(self.view.bounds) - 320) * 0.5, 320, 320);
}

-(void)setItem:(FJTItem *)item
{
    _item = item;
    _bigImage.image = [UIImage imageNamed:item.bigIcon];
    CGFloat r = [item.colors[0] doubleValue] / 255.0;
    CGFloat g = [item.colors[1] doubleValue] / 255.0;
    CGFloat b = [item.colors[2] doubleValue] / 255.0;
    self.view.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
    
}
@end
