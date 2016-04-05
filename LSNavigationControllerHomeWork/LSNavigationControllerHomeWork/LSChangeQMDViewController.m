//
//  LSChangeQMDViewController.m
//  LSNavigationControllerHomeWork
//
//  Created by qingyun on 16/4/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSChangeQMDViewController.h"

@interface LSChangeQMDViewController ()
@property (weak, nonatomic) IBOutlet UITextField *QMD;

@end

@implementation LSChangeQMDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self changeQMDPage];
}

- (void)changeQMDPage{
    _QMD.text = _name;
    self.navigationItem.title = @"签名页";
    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"用户中心" style:UIBarButtonItemStylePlain target:self action:@selector(backUserPage)];
    leftBarBtnItem.tintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItem = leftBarBtnItem;
}
- (void)backUserPage{
    if (_btn) {
        _btn(_QMD.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
