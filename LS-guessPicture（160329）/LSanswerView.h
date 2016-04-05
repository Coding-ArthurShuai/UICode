//
//  LSanswerView.h
//  LS-guessPicture
//
//  Created by qingyun on 16/3/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

#define screenW [UIScreen mainScreen].bounds.size.width
@interface LSanswerView : UIView
@property (nonatomic,copy)void(^answerBlk)(UIButton *sender);

+ (instancetype)answerWithAnswerLength:(NSUInteger)length;
- (void)answerClick:(UIButton *)sender;
@end
