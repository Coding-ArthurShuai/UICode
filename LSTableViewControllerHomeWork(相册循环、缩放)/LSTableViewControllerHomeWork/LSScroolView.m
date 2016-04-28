//
//  LSScroolView.m
//  LSTableViewControllerHomeWork
//
//  Created by qingyun on 16/4/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSScroolView.h"

@interface LSScroolView ()<UIScrollViewDelegate>
@property (nonatomic,strong)UIImageView *imgView;
@end

@implementation LSScroolView

- (void)setImg:(UIImage *)img{
    _img = img;
    [_imgView setImage:img];
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _imgView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self addSubview:_imgView];
        
        self.minimumZoomScale = 0.5;
        self.maximumZoomScale = 2.0;
        self.delegate = self;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickTap:)];
        tap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)clickTap:(UITapGestureRecognizer *)tap{
    if (self.zoomScale != 1.0) {
        [self setZoomScale:1.0 animated:YES];
        return;
    }
    CGPoint location = [tap locationInView:self];
    CGFloat rectW = 200;
    CGFloat rectH = 100;
    CGRect rect = CGRectMake(location.x - rectW/2.0, location.y - rectH/2.0, rectW, rectH);
    [self zoomToRect:rect animated:YES];
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _imgView;
}
@end
