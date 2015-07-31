//
//  FJTMenuViewController.h
//  WDCSliderDemo
//
//  Created by fnst001 on 15-7-31.
//  Copyright (c) 2015年 FNST. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FJTItem;
@interface FJTMenuViewController : UITableViewController
@property (nonatomic,copy) void(^menuClick)(FJTItem *item,BOOL isShowSlider);
@end
