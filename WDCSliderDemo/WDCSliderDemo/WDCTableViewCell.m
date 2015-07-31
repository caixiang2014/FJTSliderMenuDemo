//
//  WDCTableViewCell.m
//  WDCSliderDemo
//
//  Created by fnst001 on 15-7-31.
//  Copyright (c) 2015年 FNST. All rights reserved.
//

#import "WDCTableViewCell.h"
#import "FJTItem.h"

@interface WDCTableViewCell()
@property (nonatomic,strong) UIImageView *menuIcon;
@end

@implementation WDCTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _menuIcon = [[UIImageView alloc] init];
        NSLog(@"self.bounds.width = %f,self.bounds.height=%f",self.bounds.size.width,self.bounds.size.height);
        [self addSubview:_menuIcon];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    NSLog(@"self.bounds.width = %f,self.bounds.height=%f",self.bounds.size.width,self.bounds.size.height);
    self.menuIcon.frame = self.bounds;
}

-(void)setItem:(FJTItem *)item
{
    _item = item;
    _menuIcon.image = [UIImage imageNamed:item.smallIcon];
    CGFloat r = [item.colors[0] doubleValue] / 255.0;
    CGFloat g = [item.colors[1] doubleValue] / 255.0;
    CGFloat b = [item.colors[2] doubleValue] / 255.0;
    self.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.0];
}
@end
