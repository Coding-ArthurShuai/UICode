//
//  LSThirdViewController.h
//  LSUITest2-160407
//
//  Created by qingyun on 16/4/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSThirdViewController : UIViewController
@property (nonatomic,copy)void(^blk)(NSString *texts);
@property (nonatomic,strong)NSString *name;
@end
