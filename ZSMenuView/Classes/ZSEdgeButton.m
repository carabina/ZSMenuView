//
//  ZSEdgeButton.m
//  EPayment
//
//  Created by safiri on 16/3/24.
//  Copyright © 2016年 com.egintra. All rights reserved.
//

#import "ZSEdgeButton.h"

@implementation ZSEdgeButton


- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect imageFrame = self.imageView.frame;
    if (imageFrame.size.height == 0) {
        return;
    }
    CGFloat distance = 2;
    CGRect titleFrame = self.titleLabel.frame;
    //NSLog(@"t %f",titleFrame.size.height);
    
    // 图片居中
    imageFrame.origin.y = (self.frame.size.height - (imageFrame.size.height+titleFrame.size.height+distance)) / 2 ;

    imageFrame.origin.x = (self.frame.size.width - imageFrame.size.width) / 2;
    self.imageView.frame = imageFrame;
    
    //设置label Frame
    titleFrame.origin.x = 0;
    titleFrame.origin.y = imageFrame.origin.y + imageFrame.size.height + distance +5;
    titleFrame.size.width = self.frame.size.width;
    self.titleLabel.frame = titleFrame;
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    self.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    //self.titleLabel.backgroundColor = [UIColor redColor];
    //----设置button 图片和文字居中----
    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    __block CGFloat edgeHImage;
    __block CGFloat edgeV;
    __block CGFloat edgeHTitle;
    CGFloat imageWidth = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat titleWidth = self.titleLabel.frame.size.width;
    CGFloat titleHeight = self.titleLabel.frame.size.height;
    
    edgeHImage = (self.frame.size.width - imageWidth)/2; //image 居中
    edgeV = (self.frame.size.height - imageHeight - titleHeight - 5)/2; //图片距上面的edge
    edgeHTitle = (self.frame.size.width - titleWidth)/2 - imageWidth;//- imageWidth使title 居中，因为左是距图片的
    
    [self setImageEdgeInsets:UIEdgeInsetsMake(edgeV, edgeHImage, 0, 0)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(edgeV + self.imageView.frame.size.height + 5, edgeHTitle, 0, 0)];
    //----设置button 图片和文字居中----

}

@end
