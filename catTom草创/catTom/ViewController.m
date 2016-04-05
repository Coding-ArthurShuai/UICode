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
}
//- (void)clearImages {
//    _cat.animationImages = nil;
//}
- (IBAction)angry:(UIButton *)sender {
    _cat = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_cat];
    NSMutableArray *angry = [NSMutableArray array];
    for (int i=0; i<26; i++) {
        NSString *imagename = [NSString stringWithFormat:@"angry_%02d.jpg",i];
//        UIImage *angryimage = [UIImage imageNamed:imagename];
        NSString *imagepath = [[NSBundle mainBundle] pathForResource:imagename ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:imagepath];
        [angry addObject:image];
    }
    _cat.animationImages = angry;
    _cat.animationDuration = 2;
    _cat.animationRepeatCount = 1;
    [_cat startAnimating];
//    [_cat performSelector:@selector(clearImages) withObject:nil afterDelay:_cat.animationDuration];
    [_cat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:_cat.animationDuration];
}
- (IBAction)cymbal:(UIButton *)sender {
    _cat = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_cat];
    NSMutableArray *cymbal = [NSMutableArray array];
    for (int i=0; i<13; i++) {
        NSString *imagename = [NSString stringWithFormat:@"cymbal_%02d.jpg",i];
        NSString *imagepath = [[NSBundle mainBundle] pathForResource:imagename ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:imagepath];
        [cymbal addObject:image];
    }
    _cat.animationImages = cymbal;
    _cat.animationDuration = 2;
    _cat.animationRepeatCount = 1;
    [_cat startAnimating];
    [_cat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:_cat.animationDuration];
}
- (IBAction)drink:(UIButton *)sender {
    _cat = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_cat];
    NSMutableArray *drink = [NSMutableArray array];
    for (int i=0; i<81; i++) {
        NSString *imagename = [NSString stringWithFormat:@"drink_%02d.jpg",i];
        NSString *imagepath = [[NSBundle mainBundle] pathForResource:imagename ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:imagepath];
        [drink addObject:image];
    }
    _cat.animationImages = drink;
    _cat.animationDuration = 5;
    _cat.animationRepeatCount = 1;
    [_cat startAnimating];
    [_cat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:_cat.animationDuration];
}
- (IBAction)eat:(UIButton *)sender {
    _cat = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_cat];
    NSMutableArray *eat = [NSMutableArray array];
    for (int i=0; i<40; i++) {
        NSString *imagename = [NSString stringWithFormat:@"eat_%02d.jpg",i];
        NSString *imagepath = [[NSBundle mainBundle] pathForResource:imagename ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:imagepath];
        [eat addObject:image];
    }
    _cat.animationImages = eat;
    _cat.animationDuration = 4;
    _cat.animationRepeatCount = 1;
    [_cat startAnimating];
    [_cat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:_cat.animationDuration];
}
- (IBAction)fart:(UIButton *)sender {
    _cat = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_cat];
    NSMutableArray *fart = [NSMutableArray array];
    for (int i=0; i<28; i++) {
        NSString *imagename = [NSString stringWithFormat:@"fart_%02d.jpg",i];
        NSString *imagepath = [[NSBundle mainBundle] pathForResource:imagename ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:imagepath];
        [fart addObject:image];
    }
    _cat.animationImages = fart;
    _cat.animationDuration = 3;
    _cat.animationRepeatCount = 1;
    [_cat startAnimating];
    [_cat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:_cat.animationDuration];
}
- (IBAction)pie:(UIButton *)sender {
    _cat = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_cat];
    NSMutableArray *pie = [NSMutableArray array];
    for (int i=0; i<24; i++) {
        NSString *imagename = [NSString stringWithFormat:@"pie_%02d.jpg",i];
        NSString *imagepath = [[NSBundle mainBundle] pathForResource:imagename ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:imagepath];
        [pie addObject:image];
    }
    _cat.animationImages = pie;
    _cat.animationDuration = 2;
    _cat.animationRepeatCount = 1;
    [_cat startAnimating];
    [_cat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:_cat.animationDuration];
}
- (IBAction)scratch:(UIButton *)sender {
    _cat = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_cat];
    NSMutableArray *scratch = [NSMutableArray array];
    for (int i=0; i<56; i++) {
        NSString *imagename = [NSString stringWithFormat:@"scratch_%02d.jpg",i];
        NSString *imagepath = [[NSBundle mainBundle] pathForResource:imagename ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:imagepath];
        [scratch addObject:image];
    }
    _cat.animationImages = scratch;
    _cat.animationDuration = 5;
    _cat.animationRepeatCount = 1;
    [_cat startAnimating];
    [_cat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:_cat.animationDuration];
}
- (IBAction)footLeft:(UIButton *)sender {
    _cat = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_cat];
    NSMutableArray *footLeft = [NSMutableArray array];
    for (int i=0; i<30; i++) {
        NSString *imagename = [NSString stringWithFormat:@"footLeft_%02d.jpg",i];
        NSString *imagepath = [[NSBundle mainBundle] pathForResource:imagename ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:imagepath];
        [footLeft addObject:image];
    }
    _cat.animationImages = footLeft;
    _cat.animationDuration = 3;
    _cat.animationRepeatCount = 1;
    [_cat startAnimating];
    [_cat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:_cat.animationDuration];
}
- (IBAction)footRight:(UIButton *)sender {
    _cat = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_cat];
    NSMutableArray *footRight = [NSMutableArray array];
    for (int i=0; i<30; i++) {
        NSString *imagename = [NSString stringWithFormat:@"footRight_%02d.jpg",i];
        NSString *imagepath = [[NSBundle mainBundle] pathForResource:imagename ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:imagepath];
        [footRight addObject:image];
    }
    _cat.animationImages = footRight;
    _cat.animationDuration = 3;
    _cat.animationRepeatCount = 1;
    [_cat startAnimating];
    [_cat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:_cat.animationDuration];
}
- (IBAction)knockout:(UIButton *)sender {
    _cat = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_cat];
    NSMutableArray *knockout = [NSMutableArray array];
    for (int i=0; i<81; i++) {
        NSString *imagename = [NSString stringWithFormat:@"knockout_%02d.jpg",i];
        NSString *imagepath = [[NSBundle mainBundle] pathForResource:imagename ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:imagepath];
        [knockout addObject:image];
    }
    _cat.animationImages = knockout;
    _cat.animationDuration = 3;
    _cat.animationRepeatCount = 1;
    [_cat startAnimating];
    [_cat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:_cat.animationDuration];
}
- (IBAction)stomach:(UIButton *)sender {
    _cat = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_cat];
    NSMutableArray *stomach = [NSMutableArray array];
    for (int i=0; i<34; i++) {
        NSString *imagename = [NSString stringWithFormat:@"stomach_%02d.jpg",i];
        NSString *imagepath = [[NSBundle mainBundle] pathForResource:imagename ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile:imagepath];
        [stomach addObject:image];
    }
    _cat.animationImages = stomach;
    _cat.animationDuration = 3;
    _cat.animationRepeatCount = 1;
    [_cat startAnimating];
    [_cat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:_cat.animationDuration];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
