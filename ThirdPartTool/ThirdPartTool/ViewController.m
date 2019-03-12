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
 
    
    NSArray *topTitleArray = @[@"1_tableView样式组合",@"2_tableView基础控制器",@"3_tableView基础view（代理+继承）",@"4_tableView基础view（block+统一）"];
    NSArray *topIconArray = @[@"mingxi-1",@"mingxi-2",@"mingxi-3",@"mingxi-3"];
    NSArray *topVcArray = @[@"TableViewDemosVC",@"",@"BaseTableViewDelegateVC",@"BaseTableViewBlockVC"];
    NSMutableArray *section0 = [self addSectionArray:topTitleArray iconArray:topIconArray vcNameArray:topVcArray];
    
    NSArray *middleTitleArray = @[@"1_APP开发方案",@"2_布局方案",@"3_APP跳转方案",@"4_可以深入挖掘的第三方框架",@"5_苹果示例的代码"];
    NSArray *middleIconArray = @[@"ProjectManagement",@"buju",@"tiaozhuan",@"disanfang",@"apple"];
    NSArray *middleVcArray = @[@"CrossPlatformVC",@"",@"",@"",@""];
    NSMutableArray *section1 = [self addSectionArray:middleTitleArray iconArray:middleIconArray vcNameArray:middleVcArray];
    
    
    NSArray *famousEnterpriseArray = @[@"1_滴滴",@"2_美团",@"3_今日头条",@"4_阿里巴巴",@"5_百度",@"6_腾讯"];
    NSArray *famousiconArray = @[@"didi",@"meituan",@"jinritoutiao",@"alibaba",@"baidu",@"tengxunwang"];
    NSArray *famousVcArray = @[@"",@"",@"",@"AlibabaVC",@"",@""];
    
    NSMutableArray *section2  = [self addSectionArray:famousEnterpriseArray iconArray:famousiconArray vcNameArray:famousVcArray];

    [self.hs_dataArry addObject:section0];
    [self.hs_dataArry addObject:section1];
    [self.hs_dataArry addObject:section2];
}

#pragma mark -  添加cell的array
- (NSMutableArray *)addSectionArray:(NSArray *)titleArray iconArray:(NSArray *)iconArray vcNameArray:(NSArray *)vcNameArray{
    NSMutableArray *section = [NSMutableArray array];
    for (int i = 0; i<titleArray.count; i++) {
        HSTitleCellModel *cell =   [self addCellWithTitle:titleArray[i] iconName:iconArray[i] jumpVcName:vcNameArray[i]];
        [section addObject:cell];
    }
    return section;
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
