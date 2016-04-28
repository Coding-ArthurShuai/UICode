//
//  LSSecondViewController.m
//  LSUITest2-160407
//
//  Created by qingyun on 16/4/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSSecondViewController.h"

@interface LSSecondViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *moodText;

@property (nonatomic)NSUInteger index;

@end

@implementation LSSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _textField.text = _texts;
    
//    UIBarButtonItem *backbtn1 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Back"] style:UIBarButtonItemStylePlain target:self action:nil];
    
    UIBarButtonItem *backbtn2 = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backPage)];
    
//    self.navigationItem.leftBarButtonItems = @[backbtn1,backbtn2];
    self.navigationItem.leftBarButtonItem = backbtn2;

    _textField.enabled = NO;
//   _changeMoodBtn.enabled = NO;
    _moodText.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)backPage{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)showAndHidden:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        _textField.hidden = NO;
        _moodText.hidden = NO;
//        _changeMoodBtn.hidden = NO;
    }
    else if (sender.selectedSegmentIndex == 1){
        _textField.hidden = YES;
        _moodText.hidden = YES;
//        _changeMoodBtn.hidden = YES;
    }
}
- (IBAction)editing:(UIBarButtonItem *)sender {
    if (_index %2 != 0) {
        _textField.enabled = YES;
        _moodText.enabled = YES;
    } else {
        _textField.enabled = NO;
        _moodText.enabled = NO;
    }
    _index++;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"mood"]) {
        UIViewController *vc = segue.destinationViewController;
        [vc setValue:_moodText.text forKey:@"name"];
        [vc setValue:^(NSString *name){
            _moodText.text = name;
        } forKey:@"blk"];
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
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
