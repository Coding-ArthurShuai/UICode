//
//  AppView.h
//  LS-应用程序管理MVC
//
//  Created by qingyun on 16/3/27.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Model,ViewController;
@interface AppView : UIView
@property (nonatomic,strong)Model *model;
@property (nonatomic,weak)ViewController *viewController;

+ (instancetype)appView;
@end
