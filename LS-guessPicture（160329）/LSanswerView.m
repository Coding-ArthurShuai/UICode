//
//  LSanswerView.m
//  LS-guessPicture
//
//  Created by qingyun on 16/3/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSanswerView.h"

@implementation LSanswerView
+ (instancetype)answerWithAnswerLength:(NSUInteger)length{
    LSanswerView *answerView = [[LSanswerView alloc] initWithFrame:CGRectMake(0, 380, screenW, 34)];
    for (int i=0; i<length; i++) {//添加答案区子视图
        CGFloat space = (screenW - ((length-1)*10.0)-length*34.0)/2.0;
        UIButton *answerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [answerView addSubview:answerBtn];
        answerBtn.frame = CGRectMake(space+i*44, 0, 34, 34);
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer"] forState:UIControlStateNormal];
        [answerBtn setBackgroundImage:[UIImage imageNamed:@"btn_answer_highlighted"] forState:UIControlStateHighlighted];
        [answerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        [answerBtn addTarget:answerView action:@selector(answerClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return answerView;
}
- (void)answerClick:(UIButton *)sender{
    if (_answerBlk) {
        _answerBlk(sender);
    }
}
- (void)setFrame:(CGRect)frame{
    CGRect answerFrame = self.frame;
    answerFrame.origin = frame.origin;
    [super setFrame:answerFrame];
}
@end
