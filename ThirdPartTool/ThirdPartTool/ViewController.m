//
//  ViewController.m
//  ThirdPartTool
//
//  Created by gjfax on 2019/2/15.
//  Copyright © 2019 macheng. All rights reserved.
//

#import "ViewController.h"
#import "HSSetTableViewController.h"
#import "HSCustomCellModel.h"
#import "HSHeaderCellModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor hs_colorWithHexString:@"#EBEDEF"];
    self.title = @"优质大厂开源集锦";
    
     __weak __typeof(&*self)weakSelf = self;
    
    HSTitleCellModel *setting = [[HSTitleCellModel alloc] initWithTitle:@"0_tableView默认示例" actionBlock:^(HSBaseCellModel *model) {
        [weakSelf jumpToVC:@"TableViewDemosVC"];
    }];
    setting.icon = [UIImage imageNamed:@"mingxi"];
    setting.imageRect = CGRectMake(15, 10, 40, 40);
    setting.separateColor = [UIColor redColor];
    setting.cellHeight = 60;
    
    HSTitleCellModel *photo = [[HSTitleCellModel alloc] initWithTitle:@"1_滴滴" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击相册")
    }];
    photo.icon = [UIImage imageNamed:@"didi"];
    photo.imageRect = CGRectMake(15, 10, 40, 40);
    photo.separateColor = [UIColor orangeColor];
    photo.cellHeight = 60;
   
    
    HSTitleCellModel *favorite = [[HSTitleCellModel alloc] initWithTitle:@"2_美团" actionBlock:^(HSBaseCellModel *model) {
        HSLog(@"点击收藏")
    }];
    favorite.icon = [UIImage imageNamed:@"meituan"];
    favorite.imageRect = CGRectMake(15, 10, 40, 40);
    favorite.separateColor = [UIColor greenColor];
    favorite.cellHeight = 60;
    
    
    NSMutableArray *section0 = [NSMutableArray arrayWithObjects:setting,nil];
    NSMutableArray *section1 = [NSMutableArray arrayWithObjects:photo,favorite, nil];
    
    [self.hs_dataArry addObject:section0];
    [self.hs_dataArry addObject:section1];
    
   
}

#pragma mark -  控制器跳转
- (void)jumpToVC:(NSString *)vcName {
    
    Class class = NSClassFromString(vcName);
    UIViewController *view = [[class alloc] init];
    [self.navigationController pushViewController:view animated:YES];
}


@end
