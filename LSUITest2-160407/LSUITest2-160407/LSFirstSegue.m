//
//  LSFirstSegue.m
//  LSUITest2-160407
//
//  Created by qingyun on 16/4/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSFirstSegue.h"

@implementation LSFirstSegue
- (void)perform{
    NSString *str1 = [self.sourceViewController valueForKeyPath:@"date.text"];
    NSString *str2 = [self.sourceViewController valueForKeyPath:@"titles.text"];
    NSString *str3 = [self.sourceViewController valueForKeyPath:@"text.text"];
    if(str1.length>0 && str2.length>0&&str3.length>0){
        [self.destinationViewController setValue:str3 forKey:@"texts"];
        [self.sourceViewController.navigationController pushViewController:self.destinationViewController animated:YES];
    }
    else
        [self hint:@"不能为空哦"];
}
- (void)hint:(NSString *)message{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];

    [alertController addAction:action];
    [self.sourceViewController presentViewController:alertController animated:YES completion:nil];

}
@end
