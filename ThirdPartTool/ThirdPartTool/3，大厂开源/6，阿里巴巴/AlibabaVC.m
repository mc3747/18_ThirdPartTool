//
//  AlibabaVC.m
//  ThirdPartTool
//
//  Created by gjfax on 2019/3/12.
//  Copyright © 2019 macheng. All rights reserved.
//

#import "AlibabaVC.h"
#import "HSTextCellModel.h"

@interface AlibabaVC ()

@end

@implementation AlibabaVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *titleArray = @[@"1,开源地址",@"2,动态化方案Tangram",@"3,提高协程的coobjc",@"4,模块化编程BeeHive"];
    NSArray *detailArray = @[@"github开源地址：https://github.com/alibaba",@"",@"",@""];
    NSArray *clickDetailArray = @[@"阿里开源地址：https://opsx.alibaba.com/opensource?lang=zh-CN",@"uni-app详解\nuni-app详解",@"",@""];
    NSMutableArray *section0 = [NSMutableArray array];
    for (int i=0; i<titleArray.count; i++) {
        HSTextCellModel *cell = [self addCell:titleArray[i] detailTitle:detailArray[i] clickDetailTitle:clickDetailArray[i]];
        [section0 addObject:cell];
    }
    [self.hs_dataArry addObject:section0];
}


- (HSTextCellModel *)addCell:(NSString *)title detailTitle:(NSString *)detailTitle clickDetailTitle:(NSString *)clickDetailTitle {
    __weak __typeof(self)weakSelf = self;
    __block BOOL update = YES;
    HSTextCellModel *cell2 = [[HSTextCellModel alloc] initWithTitle:title detailText:detailTitle actionBlock:^(HSBaseCellModel *model) {
        HSTextCellModel *detailModel = (HSTextCellModel *)model;
        detailModel.detailText = (update == YES?clickDetailTitle:detailTitle);
        [weakSelf updateCellModel:detailModel];
        update = !update;
    }];
    cell2.arrowWidth = 30;
    cell2.arrowHeight = 20;
    cell2.arrowImage = [UIImage imageNamed:@"arrow_3"];
    cell2.leftPading = 100;
    cell2.detailFont = [UIFont boldSystemFontOfSize:15];
    cell2.detailColor = [UIColor blueColor];
    return cell2;
}
@end
