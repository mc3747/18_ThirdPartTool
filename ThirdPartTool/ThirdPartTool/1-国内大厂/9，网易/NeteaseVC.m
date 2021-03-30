//
//  AlibabaVC.m
//  ThirdPartTool
//
//  Created by gjfax on 2019/3/12.
//  Copyright © 2019 macheng. All rights reserved.
//

#import "NeteaseVC.h"


@interface NeteaseVC ()

@end

@implementation NeteaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"网易";
    self.sectionTitles = @[@"1,开源地址",@"2,OC项目"];
    self.cellTitles = @[@[@"https://github.com/netease",@"https://github.com/kaola-fed"],@[@"2,QMUI_iOS（UI开发）",@"3,MLeaksFinder（内存泄露）",@"4,LKImageKit（图片优化）"]];
}

@end
