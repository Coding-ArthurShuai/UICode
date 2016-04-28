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
    if (_income.text.length == 0||_expense.text.length==0) {
        [self hint];
    }
    else{
      for (int i=0; i<_expense.text.length; i++) {
        for (int j=0; j<_income.text.length; j++) {
            char ch1 = [_income.text characterAtIndex:j];
            char ch2 = [_expense.text characterAtIndex:i];
            if ((ch1<'0'||ch1>'9')||(ch2<'0'||ch2>'9')) {
                [self hint];
                break;
            }
            else{
                NSUInteger income = [_income.text integerValue];
                NSUInteger expense = [_expense.text integerValue];
                _incomeAndExpense.text = [NSString stringWithFormat:@"本月收益：\n%ld",(income-expense)];
            }
        }
      }
    }
    [_income resignFirstResponder];
    [_expense resignFirstResponder];
    //    [self.view endEditing:YES];
}
@end
