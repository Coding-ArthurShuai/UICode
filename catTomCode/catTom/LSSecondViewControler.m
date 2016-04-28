//
//  LSSecendViewControler.m
//  catTom
//
//  Created by qingyun on 16/3/24.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSSecondViewControler.h"

@implementation LSSecondViewControler
- (void)viewDidLoad{
    [super viewDidLoad];
    _cat = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"angry_00.jpg"]];
    _cat.frame = [UIScreen mainScreen].bounds;
//    _cat.image = [UIImage imageNamed:@"angry_00.jpg"];
    [self.view addSubview:_cat];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(276, 542, 39, 125);
    btn1.tag =1;
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(35 , 460, 60, 60);
    [btn2 setImage:[UIImage imageNamed:@"cymbal"] forState:UIControlStateNormal];
    btn2.tag = 2;
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(35 , 522, 60, 60);
    [btn3 setImage:[UIImage imageNamed:@"drink"] forState:UIControlStateNormal];
    btn3.tag = 3;
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.frame = CGRectMake(35 , 583, 60, 60);
    [btn4 setImage:[UIImage imageNamed:@"eat"] forState:UIControlStateNormal];
    btn4.tag = 4;
    
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn5.frame = CGRectMake(316 , 460, 60, 60);
    [btn5 setImage:[UIImage imageNamed:@"fart"] forState:UIControlStateNormal];
    btn5.tag = 5;
    
    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn6.frame = CGRectMake(315 , 522, 60, 60);
    [btn6 setImage:[UIImage imageNamed:@"pie"] forState:UIControlStateNormal];
    btn6.tag = 6;
    
    UIButton *btn7 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn7.frame = CGRectMake(315 , 583, 60, 60);
    [btn7 setImage:[UIImage imageNamed:@"scratch"] forState:UIControlStateNormal];
    btn7.tag = 7;
    
    UIButton *btn8 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn8.frame = CGRectMake(212, 662, 50, 42);
    btn8.tag = 8;
    
    UIButton *btn9 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn9.frame = CGRectMake(146, 667, 50, 42);
    btn9.tag = 9;
    
    UIButton *btn10 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn10.frame = CGRectMake(89, 123, 223, 240);
    btn10.tag = 10;
    
    UIButton *btn11 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn11.frame = CGRectMake(146, 529, 122, 100);
    btn11.tag = 11;
    
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    [self.view addSubview:btn3];
    [self.view addSubview:btn4];
    [self.view addSubview:btn5];
    [self.view addSubview:btn6];
    [self.view addSubview:btn7];
    [self.view addSubview:btn8];
    [self.view addSubview:btn9];
    [self.view addSubview:btn10];
    [self.view addSubview:btn11];
    
    [btn1 addTarget:self action:@selector(animation:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 addTarget:self action:@selector(animation:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 addTarget:self action:@selector(animation:) forControlEvents:UIControlEventTouchUpInside];
    [btn4 addTarget:self action:@selector(animation:) forControlEvents:UIControlEventTouchUpInside];
    [btn5 addTarget:self action:@selector(animation:) forControlEvents:UIControlEventTouchUpInside];
    [btn6 addTarget:self action:@selector(animation:) forControlEvents:UIControlEventTouchUpInside];
    [btn7 addTarget:self action:@selector(animation:) forControlEvents:UIControlEventTouchUpInside];
    [btn8 addTarget:self action:@selector(animation:) forControlEvents:UIControlEventTouchUpInside];
    [btn9 addTarget:self action:@selector(animation:) forControlEvents:UIControlEventTouchUpInside];
    [btn10 addTarget:self action:@selector(animation:) forControlEvents:UIControlEventTouchUpInside];
    [btn11 addTarget:self action:@selector(animation:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)animation:(UIButton *)sender {
    if ([_cat isAnimating]) {
        return;
    }
    int j;
    NSString *str = [NSString string];
    switch (sender.tag) {
        case 1:
            j = 26;
            str = @"angry";
            break;
        case 2:
            j = 13;
            str = @"cymbal";
            break;
        case 3:
            j = 81;
            str = @"drink";
            break;
        case 4:
            j = 40;
            str = @"eat";
            break;
        case 5:
            j = 28;
            str = @"fart";
            break;
        case 6:
            j = 24;
            str = @"pie";
            break;
        case 7:
            j = 56;
            str = @"scratch";
            break;
        case 8:
            j = 30;
            str = @"footLeft";
            break;
        case 9:
            j = 30;
            str = @"footRight";
            break;
        case 10:
            j = 81;
            str = @"knockout";
            break;
        case 11:
            j = 34;
            str = @"stomach";
            break;
        default:
            break;
    }
    NSMutableArray *animation = [NSMutableArray array];
//    for (int i=0; i<j; i++) {
//        [animation addObject:[NSNull null]];
//    }
    for (int i=0; i<j; i++) {
        NSString *imagename = [NSString stringWithFormat:@"%@_%02d.jpg",str,i];
        NSString *imagepath = [[NSBundle mainBundle] pathForResource:imagename ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:imagepath];
        [animation addObject:image];
//        [animation replaceObjectAtIndex:i withObject:image];
    }
    _cat.animationImages = animation;
    _cat.animationDuration = 0.08*j;
    _cat.animationRepeatCount = 1;
    [_cat startAnimating];
//    [self performSelector:@selector(clearImages) withObject:nil afterDelay:_cat.animationDuration];
    [_cat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:_cat.animationDuration];
}
//- (void)clearImages{
//    _cat.animationImages = nil;
//}
@end
