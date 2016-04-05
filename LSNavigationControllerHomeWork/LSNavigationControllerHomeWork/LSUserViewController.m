//
//  LSUserViewController.m
//  LSNavigationControllerHomeWork
//
//  Created by qingyun on 16/4/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSUserViewController.h"
#import "LSChangeQMDViewController.h"

@interface LSUserViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *QMD;

@end

@implementation LSUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self userCenterPage];

    
}
- (void)userCenterPage{
    _userName.text = [NSString stringWithFormat:@"欢迎您，%@！！！",_name];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor blackColor];
   
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backClick:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];    
}
- (IBAction)changeToChangeQMDPage:(UIBarButtonItem *)sender {
    LSChangeQMDViewController *QMDVC = [self.storyboard instantiateViewControllerWithIdentifier:@"QMD"];
    QMDVC.name = _QMD.text;
    [self.navigationController pushViewController:QMDVC animated:YES];
    QMDVC.btn = ^(NSString *name){
        _QMD.text = name;
    };
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
