//
//  LSSegue.m
//  LSNavigationControllerHomeWork
//
//  Created by qingyun on 16/4/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSSegue.h"

@implementation LSSegue

- (void)perform{
    UIViewController *loginVC = self.sourceViewController;
    UIViewController *userVC = self.destinationViewController;
    if ([[loginVC valueForKeyPath:@"userName.text"] isEqualToString:@"1"]&&[[loginVC valueForKeyPath:@"passWord.text"] isEqualToString:@"q"]) {
        [userVC setValue:[loginVC valueForKeyPath:@"userName.text"] forKey:@"name"];
        
        [loginVC.navigationController pushViewController:userVC animated:YES];
    }
    else
        [self hint:@"请重新输入"];
    
    [loginVC setValue:nil forKeyPath:@"userName.text"];
    [loginVC setValue:nil forKeyPath:@"passWord.text"];
}
- (void)hint:(NSString *)message{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:action1];
    [alertController addAction:action2];
    [self.sourceViewController presentViewController:alertController animated:YES completion:nil];

}
@end
