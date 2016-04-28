//
//  ViewController.m
//  buttonCodeCreate
//
//  Created by qingyun on 16/3/22.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIButton *btn;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(150,150,100,100);
    [btn addTarget:self action:@selector(btnclick) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:[UIImage imageNamed:@"dog1"] forState:UIControlStateNormal];
    [btn setTitle:@"秋田犬" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"dog2"] forState:UIControlStateHighlighted];
    [btn setTitle:@"萨摩耶" forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    //移动
    UIButton *btnup = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btnup];
    btnup.frame = CGRectMake(100,350,48,48);
    btnup.tag = 1;
    [btnup addTarget:self action:@selector(move:) forControlEvents:UIControlEventTouchUpInside];
    [btnup setImage:[UIImage imageNamed:@"top_normal"] forState:UIControlStateNormal];
    [btnup setImage:[UIImage imageNamed:@"top_highlighted"] forState:UIControlStateHighlighted];
    [btnup setImage:[UIImage imageNamed:@"top_disable"] forState:UIControlStateDisabled];
    
    UIButton *btnleft = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btnleft];
    btnleft.frame = CGRectMake(50,400,48,48);
    btnleft.tag = 2;
    [btnleft addTarget:self action:@selector(move:) forControlEvents:UIControlEventTouchUpInside];
    [btnleft setImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
    [btnleft setImage:[UIImage imageNamed:@"left_highlighted"] forState:UIControlStateHighlighted];
    [btnleft setImage:[UIImage imageNamed:@"left_disable"] forState:UIControlStateDisabled];
    
    UIButton *btndown = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btndown];
    btndown.frame = CGRectMake(100,450,48,48);
    btndown.tag = 3;
    [btndown addTarget:self action:@selector(move:) forControlEvents:UIControlEventTouchUpInside];
    [btndown setImage:[UIImage imageNamed:@"bottom_normal"] forState:UIControlStateNormal];
    [btndown setImage:[UIImage imageNamed:@"bottom_highlighted"] forState:UIControlStateHighlighted];
    [btndown setImage:[UIImage imageNamed:@"bottom_disable"] forState:UIControlStateDisabled];
    
    UIButton *btnright = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btnright];
    btnright.frame = CGRectMake(150,400,48,48);
    btnright.tag = 4;
    [btnright addTarget:self action:@selector(move:) forControlEvents:UIControlEventTouchUpInside];
    [btnright setImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
    [btnright setImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
    [btnright setImage:[UIImage imageNamed:@"right_disable"] forState:UIControlStateDisabled];
    
    //缩放
    UIButton *btnplus = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btnplus];
    btnplus.frame = CGRectMake(250,375,48,48);
    btnplus.tag = 5;
    [btnplus addTarget:self action:@selector(scale:) forControlEvents:UIControlEventTouchUpInside];
    [btnplus setImage:[UIImage imageNamed:@"plus_normal"] forState:UIControlStateNormal];
    [btnplus setImage:[UIImage imageNamed:@"plus_highlighted"] forState:UIControlStateHighlighted];
    [btnplus setImage:[UIImage imageNamed:@"plus_disable"] forState:UIControlStateDisabled];
    
    UIButton *btnminus = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btnminus];
    btnminus.frame = CGRectMake(325,375,48,48);
    btnminus.tag = 6;
    [btnminus addTarget:self action:@selector(scale:) forControlEvents:UIControlEventTouchUpInside];
    [btnminus setImage:[UIImage imageNamed:@"minus_normal"] forState:UIControlStateNormal];
    [btnminus setImage:[UIImage imageNamed:@"minus_highlighted"] forState:UIControlStateHighlighted];
    [btnminus setImage:[UIImage imageNamed:@"minus_disable"] forState:UIControlStateDisabled];
    
    //旋转
    UIButton *btnleft_rotate = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btnleft_rotate];
    btnleft_rotate.frame = CGRectMake(250,450,48,48);
    btnleft_rotate.tag = 7;
    [btnleft_rotate addTarget:self action:@selector(rotate:) forControlEvents:UIControlEventTouchUpInside];
    [btnleft_rotate setImage:[UIImage imageNamed:@"left_rotate_normal"] forState:UIControlStateNormal];
    [btnleft_rotate setImage:[UIImage imageNamed:@"left_rotate_highlighted"] forState:UIControlStateHighlighted];
    [btnleft_rotate setImage:[UIImage imageNamed:@"left_rotate_disable"] forState:UIControlStateDisabled];
    
    UIButton *btnright_rotate = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btnright_rotate];
    btnright_rotate.frame = CGRectMake(325,450,48,48);
    btnright_rotate.tag = 8;
    [btnright_rotate addTarget:self action:@selector(rotate:) forControlEvents:UIControlEventTouchUpInside];
    [btnright_rotate setImage:[UIImage imageNamed:@"right_rotate_normal"] forState:UIControlStateNormal];
    [btnright_rotate setImage:[UIImage imageNamed:@"right_rotate_highlighted"] forState:UIControlStateHighlighted];
    [btnright_rotate setImage:[UIImage imageNamed:@"right_rotate_disable"] forState:UIControlStateDisabled];
}
- (void)btnclick
{
}
- (void)move:(UIButton *)button
{
    CGPoint position = btn.center;
    switch (button.tag) {
        case 1:
            position.y -= 10;
            break;
        case 2:
            position.x -= 10;
            break;
        case 3:
            position.y += 10;
            break;
        case 4:
            position.x += 10;
            break;
        default:
            break;
    }
    [UIView animateWithDuration:0.5 animations:^{
        btn.center = position;
    }];
}
- (void)scale:(UIButton *)button
{
    [UIView animateWithDuration:0.5 animations:^{
        if (button.tag == 5) {
            btn.transform = CGAffineTransformScale(btn.transform, 1.2, 1.2);
        }
        else if (button.tag == 6){
            btn.transform = CGAffineTransformScale(btn.transform, 0.8, 0.8);
        }
    }];
}
- (void)rotate:(UIButton *)button
{
    [UIView animateWithDuration:0.5 animations:^{
        if (button.tag == 7) {
            btn.transform = CGAffineTransformRotate(btn.transform,-M_PI/6);
        }
        else if (button.tag == 8){
            btn.transform = CGAffineTransformRotate(btn.transform,M_PI/6);
        }
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
