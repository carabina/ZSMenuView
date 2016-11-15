//
//  ZSViewController.m
//  ZSMenuView
//
//  Created by safiri on 11/15/2016.
//  Copyright (c) 2016 safiri. All rights reserved.
//

#import "ZSViewController.h"
#import "ZSMenuView.h"

@interface ZSViewController ()<ZSMenuViewDelegate>

@end

@implementation ZSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSArray *menuImageArray = @[@"menuBtn_01",@"menuBtn_02",@"menuBtn_03",@"menuBtn_04",@"menuBtn_05",@"menuBtn_06",@"menuBtn_07",@"menuBtn_08"];
    NSArray *menuTitleArray = @[@"我的驾驶证\n",@"我的机动车\n",@"违章缴费\n",@"车管服务\n网点",@"违章处理",@"代驾服务",@"车辆审验",@"交管动态"];
    ZSMenuView *menuView = [[ZSMenuView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 130) withTitleArray:menuTitleArray withImageArray:menuImageArray andButtonNumOfLine:4];
    menuView.delegate = self;
    [self.view addSubview:menuView];
}
- (void)menuClickWithTag:(NSInteger)menuTag{
    NSLog(@"%zd",menuTag);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
