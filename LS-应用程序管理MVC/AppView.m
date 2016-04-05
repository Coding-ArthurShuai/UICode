//
//  AppView.m
//  LS-应用程序管理MVC
//
//  Created by qingyun on 16/3/27.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "AppView.h"
#import "Model.h"
#import "ViewController.h"
@interface AppView ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *appName;

@end

@implementation AppView

+ (instancetype)appView{
    NSArray *arr = [[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil];
    return arr.firstObject;
}
- (void)setModel:(Model *)model{
    _model = model;
    _imageView.image = [UIImage imageNamed:model.icon];
    _appName.text = model.name;
}
- (IBAction)downloadWeb:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否下载" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSURL *path = [NSURL URLWithString:self.model.link];
        [[UIApplication sharedApplication] openURL:path];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action1];
    [alert addAction:action2];
    
    [_viewController presentViewController:alert animated:YES completion:nil];
}

@end
