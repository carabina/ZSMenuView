//
//  ZSEdgeButton.h
//  EPayment
//
//  Created by safiri on 16/3/24.
//  Copyright © 2016年 com.egintra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSEdgeButton : UIButton

@end

/* 文字在左，图片在右
 [titleButton setImage:[UIImage imageNamed:@"downJiantou"] forState:UIControlStateNormal];
 
 [titleButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -titleButton.imageView.frame.size.width, 0, titleButton.imageView.frame.size.width)];
 [titleButton setImageEdgeInsets:UIEdgeInsetsMake(0, titleButton.titleLabel.bounds.size.width, 0, -titleButton.titleLabel.bounds.size.width)];

 uibutton默认是左图片，右文字。并且在设置edge insets之前，位置已经有了设定。所以设置title的edge insets，真实的作用是在原来的边距值基础上增加或减少某个间距，负值便是减少。以title为例，设置右边距增加图片宽度，就使得自己的右边界距离按钮的右边界多了图片的宽度，正好放下图片。此时，title lable变小了，而title lable的左边界还在原来的位置上，所以lable的左边界距离按钮的左边界减少图片的宽度，lable就和原来一样大了，而且左侧起始位置和图片的左侧起始位置相同了。
 

 */