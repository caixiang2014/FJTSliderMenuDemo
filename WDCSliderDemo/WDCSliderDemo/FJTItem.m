//
//  FJTItem.m
//  WDCSliderDemo
//
//  Created by fnst001 on 15-7-31.
//  Copyright (c) 2015年 FNST. All rights reserved.
//

#import "FJTItem.h"

@implementation FJTItem

-(instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self.smallIcon = [dic objectForKey:@"image"];
        self.bigIcon = [dic objectForKey:@"bigImage"];
        self.colors = [dic objectForKey:@"colors"];
    }
    return self;
}
@end
