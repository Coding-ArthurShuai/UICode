//
//  ViewController.m
//  LSScrollViewHomeWork
//
//  Created by qingyun on 16/4/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic)UIScrollView *scrollView;
@property (nonatomic,strong)UIImageView *img;

@property (nonatomic)NSUInteger index;
@property (nonatomic)NSUInteger index2;
@property (nonatomic)CGFloat X;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screenW+20, screenH)];
    [self.view addSubview:_scrollView];
    _scrollView.contentSize = CGSizeMake((screenW+20)*6, screenH);
    _scrollView.bounces = YES;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    
    _X = 1.2;
    
    for (int i=0; i<6; i++) {
        UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"new_feature_%d",i+1]]];
        [_scrollView addSubview:img];
        img.tag = i+100;
        img.frame = CGRectMake((screenW+20)*i, 0, screenW, screenH);
    }
   
    _scrollView.minimumZoomScale = 0.2;
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.bouncesZoom = NO;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleClick:)];
    tap.numberOfTapsRequired = 2;
    [_scrollView addGestureRecognizer:tap];
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //重置缩放功能1
    _img.transform  = CGAffineTransformIdentity;
    _X = 1.2;
//    //重置缩放功能2
//    _scrollView.zoomScale = 1.0;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //循环
    _index2 = _scrollView.contentOffset.x/(screenW+20);
    NSUInteger i = _index2+1;
    if (i == 6) {
//        [self presentedViewController];
        scrollView.contentOffset = CGPointMake(0, 0);
    }
}

-(void)doubleClick:(UITapGestureRecognizer *)tap {

    //功能1：可持续放大，到达放大临界最大值时，会缩小，当缩小到最小临界时，会放大，实现循环放大缩小
    _index = _scrollView.contentOffset.x/(screenW+20);
    _img = _scrollView.subviews[_index];
//    _img = [_scrollView viewWithTag:_index+100];
    _img.transform = CGAffineTransformScale(_img.transform, _X, _X);
    if (_img.frame.size.width >= 435*_scrollView.maximumZoomScale) {
        _X = 0.8;
    }
    else if (_img.frame.size.width <= 435*_scrollView.minimumZoomScale){
        _X = 1.2;
    }

#if 0
    if (_index2 == 3) {
        _index2 = 0;
        _scrollView.zoomScale = 1.0;
        return;
    }
    //功能2：简单第一次点击缩小，第二次点击回到原图，第三次放大
    if (_index2%3 == 0) {
        _scrollView.zoomScale = 0.8;
    }
    else if(_index2%3 == 1){
        _scrollView.zoomScale = 1.0;
    }
     if(_index2%3 == 2){
        _scrollView.zoomScale = 1.2;
    }
    _index2++;
#endif
}
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    _index = _scrollView.contentOffset.x/(screenW+20);
    _img = _scrollView.subviews[_index];
//    _img = [_scrollView viewWithTag:_index+100];
    return _img;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
