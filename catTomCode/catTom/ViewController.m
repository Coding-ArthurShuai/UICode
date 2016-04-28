//
//  ViewController.m
//  catTom
//
//  Created by qingyun on 16/3/24.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic)UIImageView *cat;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *image0 = [UIImage imageNamed:@"Default"];
    UIImageView *imageview0 = [[UIImageView alloc] initWithImage:image0];
    imageview0.frame = [UIScreen mainScreen].bounds;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:btn];
    [self.view addSubview:imageview0];
    
    [btn addTarget:self action:@selector(change) forControlEvents:UIControlEventTouchUpInside];
}
- (void)change{
    LSSecondViewControler *vc = [[LSSecondViewControler alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
