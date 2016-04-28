//
//  LSChangeQMDViewController.h
//  LSNavigationControllerHomeWork
//
//  Created by qingyun on 16/4/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSChangeQMDViewController : UIViewController
@property (nonatomic,strong)NSString *name;
@property (nonatomic,copy)void(^btn)(NSString *);
@end
