//
//  ViewController.m
//  button
//
//  Created by qingyun on 16/3/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *dog;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)move:(UIButton *)sender {
//#if 0
//    CGRect location = _dog.frame;
//    switch (sender.tag) {
//        case 1:
//            location.origin.y -= 10;
//            break;
//        case 2:
//            location.origin.x -= 10;
//            break;
//        case 3:
//            location.origin.y += 10;
//            break;
//        case 4:
//            location.origin.x += 10;
//            break;
//        default:
//            break;
//    }
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.5];
//    _dog.frame = location;
//    [UIView commitAnimations];
//#else
//    CGPonit location = _dog.frame;
//    switch (sender.tag) {
//        case 1:
//            location.y -= 10;
//            break;
//        case 2:
//            location.x -= 10;
//            break;
//        case 3:
//            location.y += 10;
//            break;
//        case 4:
//            location.x += 10;
//            break;
//        default:
//            break;
//    }
//    [UIView animateWithDuration:0.5 animations:^{
//        _dog.frame = location;
//    }];
//#endif
//以上利用按钮的frame属性平移改变位置时，单独作用时，无问题，若与缩放、旋转配合作用时，会出现不正常现象
    CGPoint location = _dog.center;
    switch (sender.tag) {
        case 1:
            location.y -= 10;
            break;
        case 2:
            location.x -= 10;
            break;
        case 3:
            location.y += 10;
            break;
        case 4:
            location.x += 10;
            break;
        default:
            break;
    }
    [UIView animateWithDuration:0.5 animations:^{
        _dog.center = location;
    }];
//利用按钮的Center属性进行平移改变位置时，可以单独作用，也可以与利用transform方法的缩放、旋转配合作用//
}
- (IBAction)size:(UIButton *)sender {
    [UIView animateWithDuration:0.5 animations:^{
        if (sender.tag == 5) {
            _dog.transform = CGAffineTransformScale(_dog.transform,1.2,1.2);
        }else if (sender.tag == 6){
            _dog.transform = CGAffineTransformScale(_dog.transform,0.8,0.8);
        }
    }];
}
- (IBAction)rotate:(UIButton *)sender {
    _dog.transform = _dog.transform;
    [UIView animateWithDuration:0.5 animations:^{
        if (sender.tag == 7) {
            _dog.transform = CGAffineTransformRotate(_dog.transform, -(M_PI/6));
        }else if (sender.tag == 8){
            _dog.transform = CGAffineTransformRotate(_dog.transform, (M_PI/6));
        }
    }];

}
@end
