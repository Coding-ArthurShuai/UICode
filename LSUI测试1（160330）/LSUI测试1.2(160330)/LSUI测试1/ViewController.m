//
//  ViewController.m
//  LSUI测试1
//
//  Created by qingyun on 16/3/30.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "LSAppModel.h"
#import "LSFunctionView.h"

#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *income;
@property (weak, nonatomic) IBOutlet UITextField *expense;
@property (weak, nonatomic) IBOutlet UILabel *incomeAndExpense;

@property (nonatomic,strong)NSArray *apps;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    LSFunctionView *functionView = [LSFunctionView functionViewWithArray:self.apps];
    [self.view addSubview:functionView];
    functionView.frame = CGRectMake(0, screenH/2.0, screenW, screenH/2.0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)apps{
    if (_apps == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"image" ofType:@"plist"];
        _apps = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dict in _apps) {
            LSAppModel *model = [[LSAppModel alloc] initWithDictionary:dict];
            [arr addObject:model];
        }
        _apps = arr;
    }
    return _apps;
}
- (void)hint{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"请输入数字" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _income.text = nil;
        _expense.text = nil;
        _incomeAndExpense.text = nil;
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}
- (IBAction)btnClick:(UIButton *)sender {
    NSString *str = @"\\d*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",str];
    if ([pred evaluateWithObject:_income.text] && [pred evaluateWithObject:_expense.text]) {
        NSUInteger income = [_income.text integerValue];
        NSUInteger expense = [_expense.text integerValue];
        _incomeAndExpense.text = [NSString stringWithFormat:@"本月收益：\n%ld",(income-expense)];
    }
    else
        [self hint];
    [_income resignFirstResponder];
    [_expense resignFirstResponder];
//    [self.view endEditing:YES];
}
@end
