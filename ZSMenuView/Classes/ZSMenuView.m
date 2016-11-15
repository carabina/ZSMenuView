//
//  MainMenuView.m
//  EPayment
//
//  Created by safiri on 16/3/23.
//  Copyright © 2016年 com.egintra. All rights reserved.
//

#import "ZSMenuView.h"
#import "ZSEdgeButton.h"

@interface ZSMenuView ()

@property (nonatomic ,assign)NSUInteger buttonNumOfLine;
@property (nonatomic ,strong)NSMutableArray *titleArray;
@property (nonatomic ,strong)NSMutableArray *imageArray;

@end

@implementation ZSMenuView
@synthesize titleArray,imageArray;

- (instancetype)initWithFrame:(CGRect)frame withTitleArray:(NSArray *)menuTitleArray withImageArray:(NSArray *)menuImageArray andButtonNumOfLine:(NSUInteger)numberOfLine
{
    self = [super initWithFrame:frame];
    if (self) {
        self.buttonNumOfLine = numberOfLine > 0 ? numberOfLine:4;
        self.titleArray = [NSMutableArray arrayWithArray:menuTitleArray];
        self.imageArray = [NSMutableArray arrayWithArray:menuImageArray];
        self.backgroundColor = self.separationLineColor ? self.separationLineColor : [UIColor lightGrayColor];
        [self createUI];
    }
    return self;
}

- (void)createUI{
    
    [[self subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGFloat menuViewWidth = self.frame.size.width;
    CGFloat separateLineWidth = 0.5;//分隔线宽度
    CGFloat buttonWidth = (menuViewWidth - separateLineWidth*(self.buttonNumOfLine - 1)) / self.buttonNumOfLine;//菜单按钮宽度
    CGFloat buttonHeight = buttonWidth * 1.1;//按钮高度
    NSInteger menuLines = titleArray.count / self.buttonNumOfLine;//菜单行数
    CGFloat menuViewHeight = buttonHeight*menuLines + separateLineWidth*menuLines;//菜单高度
    CGRect selfFrame = self.frame;
    selfFrame.size.height = menuViewHeight;
    self.frame = selfFrame;
    
    
    for (NSInteger i = 0; i < titleArray.count; i++) {
        ZSEdgeButton *button = [ZSEdgeButton buttonWithType:UIButtonTypeCustom];
        button.tag = i;
        [button setFrame:CGRectMake(i%self.buttonNumOfLine * (buttonWidth + separateLineWidth), i/self.buttonNumOfLine * (buttonHeight + separateLineWidth), buttonWidth, buttonHeight)];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [button setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateHighlighted];
        [button setBackgroundImage:[self imageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [button setBackgroundImage:[self imageWithColor:[UIColor colorWithWhite:0.9 alpha:1]] forState:UIControlStateHighlighted];
        [button setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor darkTextColor] forState:UIControlStateHighlighted];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:button];
        
    }
    
    //加分隔线 注释掉是因为直接用缝隙中透出的菜单背景颜色作为分隔线
//    for (NSInteger i = 1; i < self.buttonNumOfLine; i++) {
//        UIView *separateLineViewH = [[UIView alloc]init];
//        [separateLineViewH setFrame:CGRectMake(i * (buttonWidth + separateLineWidth * (i - 1)), 0, separateLineWidth, menuViewHeight)];
//        separateLineViewH.backgroundColor = [UIColor colorWithHexColorString:@"888888"];
//        [self addSubview:separateLineViewH];
//    }
//    
//    for (NSInteger i = 1; i <= menuLines; i++) {
//        UIView *separateLineViewV = [[UIView alloc]init];
//        [separateLineViewV setFrame:CGRectMake(0, i * (buttonHeight + separateLineWidth * (i - 1)), menuViewWidth, separateLineWidth)];
//        separateLineViewV.backgroundColor = [UIColor colorWithHexColorString:@"888888"];
//        [self addSubview:separateLineViewV];
//    }
}
- (void)buttonClick:(UIButton *)button{
    if ([self.delegate respondsToSelector:@selector(menuClickWithTag:)]) {
        [self.delegate menuClickWithTag:button.tag];
    }
}
- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
