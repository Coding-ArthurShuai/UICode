//
//  ViewController.m
//  LSUITest2-160407
//
//  Created by qingyun on 16/4/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "LSSecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *date;
@property (weak, nonatomic) IBOutlet UITextField *titles;
@property (weak, nonatomic) IBOutlet UITextField *text;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)switchClick:(UISwitch *)sender {
    if (sender.on == NO) {
        _date.enabled = NO;
        _titles.enabled = NO;
        _text.enabled = NO;
        [self hint:@"现在还不能出入哦，请打开开关!"];
    }else{
        _date.enabled = YES;
        _titles.enabled = YES;
        _text.enabled = YES;
    }
}
- (void)hint:(NSString *)message{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

@end
