//
//  ViewController.m
//  catTom
//
//  Created by qingyun on 16/3/24.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *cat;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)animation:(UIButton *)sender {
    if ([_cat isAnimating]) {
        return;
    }
//    [self.view insertSubview:_cat atIndex:1];
    NSMutableArray *animation = [NSMutableArray array];
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
            str = @"footRight";
            break;
        case 9:
            j = 30;
            str = @"footLeft";
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
    for (int i=0; i<j; i++) {
        NSString *imagename = [NSString stringWithFormat:@"%@_%02d.jpg",str,i];
        NSString *imagepath = [[NSBundle mainBundle] pathForResource:imagename ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:imagepath];
        [animation addObject:image];
    }
    _cat.animationImages = animation;
    _cat.animationDuration = 0.08*j;
    _cat.animationRepeatCount = 1;
    [_cat startAnimating];
    [_cat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:_cat.animationDuration];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
