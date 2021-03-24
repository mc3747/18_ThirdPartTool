//
//  AlibabaVC.m
//  ThirdPartTool
//
//  Created by gjfax on 2019/3/12.
//  Copyright © 2019 macheng. All rights reserved.
//

#import "AlibabaVC.h"
#import "ElegantTableViewGenerator.h"

@interface AlibabaVC ()
@property (nonatomic, strong) ElegantTableViewGenerator *tableViewGenerator;
@end

@implementation AlibabaVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titles =  @[@"1,开源地址",@"2,动态化方案Tangram",@"3,提高协程的coobjc",@"4,模块化编程BeeHive"];
    NSArray *subTitles = @[@"阿里开源地址：https://opsx.alibaba.com/opensource?lang=zh-CN",@"uni-app详解\nuni-app详解",@"",@""];
    
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
