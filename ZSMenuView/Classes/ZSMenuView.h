//
//  MainMenuView.h
//  EPayment
//
//  Created by safiri on 16/3/23.
//  Copyright © 2016年 com.egintra. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZSMenuViewDelegate <NSObject>

- (void)menuClickWithTag:(NSInteger)menuTag;

@end
@interface ZSMenuView : UIView

@property (nonatomic ,strong)id <ZSMenuViewDelegate>delegate;
@property (nonatomic ,strong)UIColor *separationLineColor;


- (instancetype)initWithFrame:(CGRect)frame withTitleArray:(NSArray *)titleArray withImageArray:(NSArray *)imageArray andButtonNumOfLine:(NSUInteger)numberOfLine NS_DESIGNATED_INITIALIZER;
@end
