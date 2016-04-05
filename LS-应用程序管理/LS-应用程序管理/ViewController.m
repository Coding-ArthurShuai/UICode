//
//  ViewController.m
//  LS-应用程序管理
//
//  Created by qingyun on 16/3/25.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)UIImageView *image;
@property (nonatomic,strong)UIButton *button;
@property (nonatomic,strong)UILabel *name;
@property (nonatomic,strong)NSArray *arr;
@property (nonatomic)int index;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self applicationManage];//初次初始化
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSArray *)arr{
    if (_arr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"];
        _arr = [NSArray arrayWithContentsOfFile:path];
    }
    return _arr;
}

- (void)applicationReveal{
    //设置button属性
    NSDictionary *dict = self.arr[_index];
    NSString *applicationName = dict[@"name"];
    _name.text = applicationName;
    [_button setTitle:@"下载" forState:UIControlStateNormal];
    _name.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:15];
    [_button setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
    [_button setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
    _button.titleLabel.font = [UIFont fontWithName:@"Arial-BoldItalicMT" size:15];
    //设置imageView属性
    NSString *icon = dict[@"icon"];
    _image.image = [UIImage imageNamed:icon];
}
- (void)gotoWebView:(UIButton *)sender{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否下载该应用程序" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSDictionary *dict = self.arr[sender.tag-1];
            NSString *webURL = dict[@"link"];
            NSURL *url = [NSURL URLWithString:webURL];
            [[UIApplication sharedApplication] openURL:url];
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action1];
        [alert addAction:action2];
        [self presentViewController:alert animated:YES completion:nil];
}
- (void)applicationManage{
    int countx = 0;
    int county = 0;
    for (int i=0; i<=self.arr.count/4; i++) {//行
        for (int j=0; j<4; j++) {//列
            countx = j*86;
            county = i*114;
            if (_index < self.arr.count) {//判断应用程序数量
                _image = [[UIImageView alloc] initWithFrame:CGRectMake(26+countx, 45+county, 60, 60)];
                _name = [[UILabel alloc] initWithFrame:CGRectMake(26+countx, 104+county, 60, 20)];
                _button = [UIButton buttonWithType:UIButtonTypeCustom];
                _button.frame = CGRectMake(26+countx, 124+county, 60, 20);
                _button.tag = _index+1;
                [_button addTarget:self action:@selector(gotoWebView:) forControlEvents:UIControlEventTouchUpInside];
                
                [self applicationReveal];
                [self.view addSubview:_image];
                [self.view addSubview:_name];
                [self.view addSubview:_button];
            }
            _index++;
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
