//
//  ViewController.m
//  LS-图片浏览器
//
//  Created by qingyun on 16/3/26.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UIButton *leftButton;
@property (weak, nonatomic) IBOutlet UIButton *rightButton;
@property (weak, nonatomic) IBOutlet UIButton *imageButton;

@property (nonatomic, strong) NSArray *images;
@property (nonatomic) NSInteger currentIndex;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self changeContentForSubViews];
    // Do any additional setup after loading the view, typically from a nib.
}
-(NSArray *)images{
    if (_images == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Images" ofType:@"plist"];
        _images = [NSArray arrayWithContentsOfFile:path];
    }
    return _images;
}
-(void)changeContentForSubViews{
    _firstLabel.text = [NSString stringWithFormat:@"%ld/%ld",_currentIndex + 1,self.images.count];
    NSDictionary *dict = self.images[_currentIndex];
    NSString *imageName = dict[@"name"];
    [_imageButton setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    _secondLabel.text = dict[@"desc"];
    _leftButton.enabled = _currentIndex == 0 ? NO : YES;
    _rightButton.enabled = _currentIndex == self.images.count - 1 ? NO : YES;
}
- (IBAction)btnClick:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
            _currentIndex--;
            break;
        case 2:
            _currentIndex++;
            break;
        default:
            break;
    }
    [self changeContentForSubViews];
}
- (IBAction)gotoWebView:(UIButton *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否查看详细内容" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSDictionary *dict = self.images[_currentIndex];
        NSString *urlString = dict[@"url"];
        NSURL *url = [NSURL URLWithString:urlString];
        [[UIApplication sharedApplication] openURL:url];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action1];
    [alert addAction:action2];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
