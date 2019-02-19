//
//  CrossPlatformVC.m
//  ThirdPartTool
//
//  Created by gjfax on 2019/2/18.
//  Copyright © 2019 macheng. All rights reserved.
//

#import "CrossPlatformVC.h"
#import "HSTextCellModel.h"

@interface CrossPlatformVC ()

@end

@implementation CrossPlatformVC

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor lightGrayColor];
    
    NSArray *titleArray = @[@"1,RN",@"2,uni-app",@""];
    NSArray *detailArray = @[@"",@"",@""];
    NSArray *clickDetailArray = @[@"RN详解\nRN详解",@"uni-app详解\nuni-app详解",@""];
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
    cell2.arrowImage = [UIImage imageNamed:@"MoreMyBankCard"];
    cell2.leftPading = 100;
    cell2.detailFont = [UIFont boldSystemFontOfSize:20];
    cell2.detailColor = [UIColor blueColor];
    return cell2;
}

@end
