//
//  FJTItem.h
//  WDCSliderDemo
//
//  Created by fnst001 on 15-7-31.
//  Copyright (c) 2015年 FNST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FJTItem : NSObject
@property (nonatomic,strong) NSString *smallIcon;
@property (nonatomic,strong) NSString *bigIcon;
@property (nonatomic,strong) NSArray *colors;

-(instancetype)initWithDictionary:(NSDictionary *)dic;
@end
