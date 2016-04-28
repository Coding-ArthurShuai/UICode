//
//  ViewController.m
//  LSEventHomeWork(160425)
//
//  Created by qingyun on 16/4/25.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *megView;
@property (weak, nonatomic) IBOutlet UIImageView *cyanView;
@property (weak, nonatomic) IBOutlet UIImageView *yellView;
@property (nonatomic)CGRect frame1;
@property (nonatomic)CGRect frame2;
@property (nonatomic)CGRect frame3;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    UITouch *tapTouch = [touches anyObject];
    UIImageView *img = (UIImageView *)[touches anyObject].view;
    if ([self judgeImagePoint:point]){
        [UIView animateWithDuration:0.3 animations:^{
            img.transform = CGAffineTransformMakeScale(1.2, 1.2);
        }];
    }
    if (tapTouch.tapCount == 2&&![self judgeImagePoint:point]){
        _megView.frame = _frame1;
        _cyanView.frame = _frame2;
        _yellView.frame = _frame3;
    }
}
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self.view];
    [self movingJudeWithPoint:point];
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UIImageView *img = (UIImageView *)[touches anyObject].view;
    img.transform = CGAffineTransformIdentity;
}
- (BOOL)judgeImagePoint:(CGPoint)point
{
    for (NSInteger i = 0; i < self.view.subviews.count; i++) {
        UIImageView *img = self.view.subviews[i];
        if (CGRectContainsPoint(img.frame, point)) return YES;
    }
    return NO;
}
- (void)movingJudeWithPoint:(CGPoint)point{
    [self.view.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *img = (UIImageView *)obj;
        if (CGRectContainsPoint(img.frame, point)){
            img.center = point;
            img.transform = CGAffineTransformMakeScale(1.2, 1.2);
        }
    }];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _frame1 = _megView.frame;
    _frame2 = _cyanView.frame;
    _frame3 = _yellView.frame;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
