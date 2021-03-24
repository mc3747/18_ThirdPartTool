//
//  AlibabaVC.m
//  ThirdPartTool
//
//  Created by gjfax on 2019/3/12.
//  Copyright © 2019 macheng. All rights reserved.
//

#import "TencentVC.h"
#import "ElegantTableViewGenerator.h"

@interface TencentVC ()
@property (nonatomic, strong) ElegantTableViewGenerator *tableViewGenerator;
@end

@implementation TencentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titles =  @[@"1,开源地址",@"2,QMUI_iOS",@"3,MLeaksFinder",@"4,LKImageKit"];
    NSArray *subTitles = @[@"腾讯开源地址：https://github.com/Tencent",@"UI开发",@"内存泄露",@"图片优化"];
    
    self.tableViewGenerator = [ElegantTableViewGenerator createWithFrame:self.view.bounds
                                                        titles:titles
                                                        subTitles:subTitles
                                                        images:nil
                                                        rowHeight:60
                                                       didSelectRowBlock:^(UITableView *tableView, NSIndexPath *indexPath) {
        NSLog(@"点击TableView-->%ld", (long)indexPath.row);
       
    }                                                   didScrollBlock:^(UIScrollView *tableView, CGPoint contentOffset) {
        NSLog(@"滚动TableView-->%@", NSStringFromCGPoint(contentOffset));
       
    }];
    
    [self.view addSubview:self.tableViewGenerator.tableView];
}

@end
