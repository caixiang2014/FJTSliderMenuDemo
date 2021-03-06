//
//  FJTSlideMainViewController.m
//  WDCSliderDemo
//
//  Created by fnst001 on 15-7-31.
//  Copyright (c) 2015年 FNST. All rights reserved.
//

#import "FJTSlideMainViewController.h"
#import "FJTDetailViewController.h"
#import "FJTMenuViewController.h"
#import "FJTItem.h"

static NSInteger const sliderBarWith = 80;
@interface FJTSlideMainViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)FJTMenuViewController *menuViewController;
@property (nonatomic,strong)FJTDetailViewController *detailViewController;
@property (nonatomic,assign)BOOL isShowMenuBar;
@end

@implementation FJTSlideMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupScrollView];
    [self setupViewController];
    [self setupView];
    
}
- (void)setupScrollView
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scrollView.contentSize = CGSizeMake(sliderBarWith + CGRectGetWidth(self.view.frame), 0);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.bounces = NO;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];

}

-(void)setupViewController
{
    self.menuViewController = [[FJTMenuViewController alloc] init];
    UINavigationController *menuNavigationController = [[UINavigationController alloc] initWithRootViewController: _menuViewController];
   
    [self addChildViewController:menuNavigationController];
    
    self.detailViewController = [[FJTDetailViewController alloc] init];
    UINavigationController *detailNavigationController = [[UINavigationController alloc] initWithRootViewController:_detailViewController];
  
    [self addChildViewController:detailNavigationController];
    
    
    //设置导航条样式
    menuNavigationController.navigationBar.barStyle = UIBarStyleBlack;
    detailNavigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    //设置导航条的透明效果,translucent设置为no时,表示view不会再穿透导航条,所以会下移64
    menuNavigationController.navigationBar.translucent = NO;
    detailNavigationController.navigationBar.translucent = NO;
    
    //去掉导航条下面的阴影效果的那条线
    menuNavigationController.navigationBar.clipsToBounds = YES;
    detailNavigationController.navigationBar.clipsToBounds = YES;
    
    __weak FJTSlideMainViewController *menuViewCtrSelf = self;
    _menuViewController.menuClick = ^(FJTItem *item,BOOL isHideSliderBar){
        menuViewCtrSelf.detailViewController.item = item;
        [menuViewCtrSelf showHideMenu:isHideSliderBar animated:YES];
    };
    
    __weak FJTSlideMainViewController *detailViewCtrSelf = self;
    _detailViewController.leftBarButtonClick = ^(){
        [detailViewCtrSelf showHideMenu:!detailViewCtrSelf.isShowMenuBar animated:YES];
    };
    
    self.menuViewController.view.layer.anchorPoint = CGPointMake(1, 0.5);
}

-(void)setupView
{
    _menuViewController.parentViewController.view.frame = CGRectMake(0, 0, sliderBarWith, CGRectGetHeight(_scrollView.bounds));
    [self.scrollView addSubview:_menuViewController.parentViewController.view];
    
    _detailViewController.parentViewController.view.frame = CGRectMake(sliderBarWith, 0, CGRectGetWidth(_scrollView.bounds), CGRectGetHeight(_scrollView.frame));
    [self.scrollView addSubview:_detailViewController.parentViewController.view];
}

-(void)showHideMenu:(BOOL)showOrHide animated:(BOOL)animated
{
    [_scrollView setContentOffset:showOrHide ? CGPointZero:CGPointMake(sliderBarWith, 0) animated:animated];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.isShowMenuBar = scrollView.contentOffset.x < sliderBarWith;
}

@end
