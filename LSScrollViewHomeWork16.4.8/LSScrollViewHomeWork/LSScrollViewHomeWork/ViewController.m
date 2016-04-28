//
//  ViewController.m
//  LSScrollViewHomeWork
//
//  Created by qingyun on 16/4/8.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic,strong)UIImageView *img;
@property (nonatomic)int index;
@property (nonatomic)int index2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _scrollView.contentSize = CGSizeMake(435*6, 736);
    _scrollView.bounces = YES;
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    
    _scrollView.minimumZoomScale = 0.2;
    _scrollView.maximumZoomScale = 2.0;
    _scrollView.bouncesZoom = NO;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleClick:)];
  
    tap.numberOfTapsRequired = 2;
    [_scrollView addGestureRecognizer:tap];
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    _img.transform  = CGAffineTransformIdentity;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (_index == 6) {
        _index = 0;
        [UIView animateWithDuration:0.5 animations:^{
            scrollView.contentOffset = CGPointMake(0, 0);
        }];
        return;
    }
    _index++;
}

-(void)doubleClick:(UITapGestureRecognizer *)tap {

    //功能1：可持续放大，到达放大临界最大值时，会缩小，当缩小到最小临界时，会放大，实现循环放大缩小
    static CGFloat  X = 1.2;
    _img = [_scrollView viewWithTag:_index+100];
    _img.transform = CGAffineTransformScale(_img.transform, X, X);
    if (_img.frame.size.width >= 435*_scrollView.maximumZoomScale) {
        X = 0.8;
    }
    else if (_img.frame.size.width <= 435*_scrollView.minimumZoomScale){
        X = 1.2;
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
    _img = [_scrollView viewWithTag:_index+100];
    return _img;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
