//
//  ViewController.m
//  LSTableViewControllerHomeWork
//
//  Created by qingyun on 16/4/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "LSScroolView.h"

#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreenH [UIScreen mainScreen].bounds.size.height
#define ImageCount 6
@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)NSArray *imageArr;
@property (nonatomic)NSInteger index;

@end

@implementation ViewController

- (NSArray *)imageArr{
    if (_imageArr == nil) {
        NSMutableArray *arr = [NSMutableArray array];
        for (int i=0; i<ImageCount; i++) {
            NSString *imgName = [NSString stringWithFormat:@"new_feature_%d@2x",i + 1];
            NSString *imgPath = [[NSBundle mainBundle] pathForResource:imgName ofType:@"png"];
            [arr addObject:imgPath];
        }
        _imageArr = arr;
    }
    return _imageArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self makeScrollView];
    [self addZoomScrollViewForScrollView];
    [self configurationImageForZoomScrollViews];
}
- (void)makeScrollView{
    _scrollView =[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, QYScreenW + 25, QYScreenH)];
    [self.view addSubview:_scrollView];
    
    _scrollView.contentSize = CGSizeMake((QYScreenW + 25) * ImageCount, QYScreenH);
    _scrollView.pagingEnabled = YES;
    _scrollView.backgroundColor = [UIColor blackColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
}
- (void)addZoomScrollViewForScrollView{
    for (int i=0; i<3; i++) {
        LSScroolView *zoomScrollView = [[LSScroolView alloc] initWithFrame:CGRectMake((QYScreenW+25)*i, 0, QYScreenW, QYScreenH)];
        [_scrollView addSubview:zoomScrollView];
        zoomScrollView.tag = i+100;
    }
}

-(NSInteger)enableForIndex:(NSInteger)index {
    if (index < 0) {
        return self.imageArr.count - 1;
    }else{
        return index % (self.imageArr.count);
    }
}

-(void)configurationImageForZoomScrollViews{
    LSScroolView *leftZoomScrollView = [_scrollView viewWithTag:100];
    LSScroolView *middleZoomScrollView = [_scrollView viewWithTag:101];
    LSScroolView *rightZoomScrollView = [_scrollView viewWithTag:102];
    
    NSInteger leftIndex = [self enableForIndex:(_index - 1)];
    leftZoomScrollView.img = [UIImage imageWithContentsOfFile:self.imageArr[leftIndex]];
    
    NSInteger middleIndex = [self enableForIndex:(_index)];
    middleZoomScrollView.img = [UIImage imageWithContentsOfFile:self.imageArr[middleIndex]];
    
    NSInteger rightIndex = [self enableForIndex:(_index + 1)];
    rightZoomScrollView.img = [UIImage imageWithContentsOfFile:self.imageArr[rightIndex]];
    
    [_scrollView setContentOffset:CGPointMake((QYScreenW + 25), 0)];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [scrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[LSScroolView class]]) {
            LSScroolView *zoomScrollView = obj;
            [zoomScrollView setZoomScale:1.0 animated:NO];
        }
    }];
    
    //滚动结束后，重置缩放zoomScrollView的图片，并设置底部滚动的scrollView的偏移量
    if (scrollView.contentOffset.x == 0) {//右滑动
        _index--;
    }else if (scrollView.contentOffset.x == (QYScreenW + 25) * 2) {//左滑动
        _index++;
    }
    
    //保证_currentIndex合法
    _index = [self enableForIndex:_index];
    
    [self configurationImageForZoomScrollViews];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
