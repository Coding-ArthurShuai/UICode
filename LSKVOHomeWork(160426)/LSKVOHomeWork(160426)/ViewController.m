//
//  ViewController.m
//  LSKVOHomeWork(160426)
//
//  Created by qingyun on 16/4/26.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *bloodView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_bloodView addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    CGRect frame = [change[@"new"] CGRectValue];
    CGFloat bloodHeight = frame.size.height;
    if (bloodHeight == 100) _bloodView.backgroundColor = [UIColor orangeColor];
    else if (bloodHeight == 200) _bloodView.backgroundColor = [UIColor magentaColor];
    else if (bloodHeight == 300) _bloodView.backgroundColor = [UIColor redColor];
    else if (bloodHeight == 400) _bloodView.backgroundColor = [UIColor purpleColor];
}
- (IBAction)bloodChange:(UISwipeGestureRecognizer *)sender {
    CGRect frame = _bloodView.frame;
    if (sender.direction == UISwipeGestureRecognizerDirectionUp) {
        frame.origin.y -=100;
        frame.size.height +=100;
    }else if (sender.direction == UISwipeGestureRecognizerDirectionDown){
        frame.origin.y +=100;
        frame.size.height -=100;
    }
    if (frame.size.height>=0&&frame.size.height<=400) {
        _bloodView.frame = frame;
        if(frame.size.height==0)[self sendMessage:@"血量太低,请加血"];
        if(frame.size.height==400)[self sendMessage:@"血量已满,无需加血"];
    }
}
- (void)sendMessage:(NSString *)mes{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message: mes preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:action1];
    [self presentViewController:alertController animated:YES completion:nil];
}
- (void)dealloc{
    [_bloodView removeObserver:self forKeyPath:@"bloodHeight"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
