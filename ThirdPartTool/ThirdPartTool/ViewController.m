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
    
    [self addCells];
    
   
}
#pragma mark -  添加cell
- (void)addCells {
 
    NSArray *topTitleArray = @[@"1_tableView展示样式",@"2_APP开发方案",@"3_可以深入挖掘的第三方框架",@"4_布局方案",@"5_APP跳转方案"];
    NSArray *topIconArray = @[@"mingxi",@"ProjectManagement",@"disanfang",@"buju",@"tiaozhuan"];
    NSArray *topVcArray = @[@"TableViewDemosVC",@"CrossPlatformVC",@"",@"",@""];
    NSMutableArray *section0 = [NSMutableArray array];
    for (int i=0; i<topTitleArray.count; i++) {
        HSTitleCellModel *cell =   [self addCellWithTitle:topTitleArray[i] iconName:topIconArray[i] jumpVcName:topVcArray[i]];
        [section0 addObject:cell];
    }
    
    
    NSArray *famousEnterpriseArray = @[@"1_滴滴",@"2_美团",@"3_今日头条",@"4_阿里巴巴",@"5_百度",@"6_腾讯"];
    NSArray *famousiconArray = @[@"didi",@"meituan",@"jinritoutiao",@"alibaba",@"baidu",@"tengxunwang"];
    NSArray *famousVcArray = @[@"",@"",@"",@"",@"",@""];
    
    NSMutableArray *section1 = [NSMutableArray array];
    for (int i = 0; i<famousVcArray.count; i++) {
     HSTitleCellModel *cell =   [self addCellWithTitle:famousEnterpriseArray[i] iconName:famousiconArray[i] jumpVcName:famousVcArray[i]];
        [section1 addObject:cell];
    }

    [self.hs_dataArry addObject:section0];
    [self.hs_dataArry addObject:section1];
}

#pragma mark -  添加cell
- (HSTitleCellModel *)addCellWithTitle:(NSString *)title iconName:(NSString *)iconName jumpVcName:(NSString *)jumpVcName {
    __weak __typeof(self)weakSelf = self;
    HSTitleCellModel *cell = [[HSTitleCellModel alloc] initWithTitle:title actionBlock:^(HSBaseCellModel *model) {
        [weakSelf jumpToVC:jumpVcName];
    }];
    cell.icon = [UIImage imageNamed:iconName];
    cell.imageRect = CGRectMake(15, 10, 40, 40);
//    cell.separateColor = [UIColor greenColor];
    cell.cellHeight = 60;
    return cell;
}

#pragma mark -  控制器跳转
- (void)jumpToVC:(NSString *)vcName {
    
    Class class = NSClassFromString(vcName);
    UIViewController *view = [[class alloc] init];
    [self.navigationController pushViewController:view animated:YES];
}


@end
