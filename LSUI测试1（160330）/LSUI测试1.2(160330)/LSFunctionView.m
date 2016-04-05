//
//  LSFunctionView.m
//  LSUI测试1
//
//  Created by qingyun on 16/3/30.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSFunctionView.h"
#import "LSAppModel.h"

#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height
@implementation LSFunctionView


+ (instancetype)functionViewWithArray:(NSArray *)arr{
    LSFunctionView *functionView = [[LSFunctionView alloc] initWithFrame:CGRectMake(0, screenH/2.0, screenW, screenH/2.0)];
    
    //定义总共3列
    int totalColumn = 3;
    CGFloat functionW = 60;
    CGFloat functionH = 70;
    //计算间距
    CGFloat spaceX = (screenW - totalColumn*functionW)/(totalColumn+1);
    CGFloat spaceY = 30;
    for (int i=0; i<arr.count; i++) {
        LSAppModel *model = arr[i];
        int column = i%totalColumn;//列
        int row = i/totalColumn;//行
        CGFloat functionX = functionW*column+spaceX*(column+1);
        CGFloat functionY = functionH*row+spaceY*(row+1);
        NSArray *functionViewArr = [[NSBundle mainBundle] loadNibNamed:@"FunctionView" owner:self options:nil];
        UIView *view = functionViewArr.firstObject;
        [functionView addSubview:view];
        view.frame = CGRectMake(functionX, functionY, functionW, functionH);
        [view setBackgroundColor:0];
        [view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (idx == 0&&[obj isKindOfClass:[UIImageView class]]) {
                UIImageView *imageView = obj;
                imageView.image = [UIImage imageNamed:model.name];
            }
            else if (idx == 1&&[obj isKindOfClass:[UILabel class]]){
                UILabel *labelView = obj;
                labelView.text = model.title;
            }
        }];
    }

    return functionView;
}

@end
