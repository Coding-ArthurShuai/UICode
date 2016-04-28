//
//  LSoptionView.m
//  LS-guessPicture
//
//  Created by qingyun on 16/3/27.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSoptionView.h"

@implementation LSoptionView

+ (instancetype)optionView{
    NSArray *optionViewArr = [[NSBundle mainBundle] loadNibNamed:@"optionView" owner:self options:nil];
    return optionViewArr.firstObject;
}
- (void)setOptionWith:(NSArray *)title{
    for (int i=0; i<title.count; i++) {//遍历添加optionView的子视图
        if ([self.subviews[i] isKindOfClass:[UIButton class]]) {//确保子视图类型是UIButton类型的
            UIButton *optionBtn = self.subviews[i];
            optionBtn.tag = i+1;//设置tag标识
            [optionBtn setTitle:title[i] forState:UIControlStateNormal];//为每一个子视图title赋值
            [optionBtn addTarget:self action:@selector(optionChoose:) forControlEvents:UIControlEventTouchUpInside];//监听子视图
        }
    }
}
- (void)optionChoose:(UIButton *)sender{
    if (_optionBlk) {
        _optionBlk(sender);//通过block块传参
    }
}
//重写setFrame方法，规定只允许更改的frame属性
- (void)setFrame:(CGRect)frame{
    CGRect optionFrame = self.frame;
    optionFrame.origin = frame.origin;
    [super setFrame:optionFrame];
}
@end
