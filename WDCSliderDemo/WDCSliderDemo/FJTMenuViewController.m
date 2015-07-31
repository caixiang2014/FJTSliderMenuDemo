//
//  FJTMenuViewController.m
//  WDCSliderDemo
//
//  Created by fnst001 on 15-7-31.
//  Copyright (c) 2015年 FNST. All rights reserved.
//

#import "FJTMenuViewController.h"
#import "WDCTableViewCell.h"
#import "FJTItem.h"
@interface FJTMenuViewController ()
@property (nonatomic,strong)NSMutableArray *items;
@end

static NSString *const identifier = @"Cell";
@implementation FJTMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *sourceFile = [[NSBundle mainBundle] pathForResource:@"MenuItems" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:sourceFile];
    self.items = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in array) {
        FJTItem *item = [[FJTItem alloc] initWithDictionary:dic];
        [_items addObject:item];
    }
    [self.tableView registerClass:[WDCTableViewCell class] forCellReuseIdentifier:identifier];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.bounces = NO;
}

#pragma mark  -- UITableViewControllerDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WDCTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.item = [_items objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return MAX(80, CGRectGetWidth(self.view.frame)/_items.count);
}
@end
