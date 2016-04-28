//
//  LSoptionView.h
//  LS-guessPicture
//
//  Created by qingyun on 16/3/27.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSoptionView : UIView
@property (nonatomic,copy)void(^optionBlk)(UIButton *sender);
+ (instancetype)optionView;
- (void)setOptionWith:(NSArray *)title;
@end
