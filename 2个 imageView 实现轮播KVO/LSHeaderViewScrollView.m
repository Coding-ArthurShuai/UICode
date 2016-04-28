//
//  LSHeaderViewScrollView.m
//  LSTGWithXib
//
//  Created by qingyun on 16/4/14.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSHeaderViewScrollView.h"

#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreenH [UIScreen mainScreen].bounds.size.height
#define ImageCount 6
@interface LSHeaderViewScrollView ()<UIScrollViewDelegate>
@property (nonatomic,strong)NSArray *imageArr;//图片数组
@property (nonatomic,strong)UIImageView *currentImg;//当前图片
@property (nonatomic,strong)UIImageView *afterImg;//下一个图片
@property (nonatomic)NSInteger currentIndex;//当前图片索引
@property (nonatomic)NSInteger afterIndex;//下一个图片索引
@property (nonatomic)NSInteger direction;//定义滑动方向标识,0为无滑动,1为左滑动,2为右滑动
@end
@implementation LSHeaderViewScrollView
//图片路径懒加载
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
//- (void)setDirection:(NSInteger)direction{
//    if (_direction == direction) return;
//    _direction = direction;
//    if (direction == 0) return;
//    if (direction == 1) {
//        _afterImg.frame = CGRectMake(0, 0, QYScreenW, 200);
//        _afterIndex = (_currentIndex-1)<0 ? self.imageArr.count-1 : _currentIndex-1;
//    }else if (direction == 2){
//        _afterImg.frame = CGRectMake(QYScreenW*2, 0, QYScreenW, 200);
//        _afterIndex = (_currentIndex+1)% self.imageArr.count;
//    }
//    _afterImg.image = [UIImage imageWithContentsOfFile:self.imageArr[_afterIndex]];
//}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentSize = CGSizeMake(QYScreenW * 3, 200);
        self.pagingEnabled = YES;
        self.bounces = NO;
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
        self.contentOffset = CGPointMake(QYScreenW, 0);
        
        self.delegate = self;
        [self loadImageForScrollView];
        
        //对方向的改变添加 KVO 监听
        [self addObserver:self forKeyPath:@"direction" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}
//初始加载2个 imageView 进行占位并赋初值
- (void)loadImageForScrollView{
    _currentImg = [[UIImageView alloc] initWithFrame:CGRectMake(QYScreenW, 0, QYScreenW, 200)];
    [self addSubview:_currentImg];
    _afterImg = [[UIImageView alloc] initWithFrame:CGRectMake(QYScreenW*2, 0, QYScreenW, 200)];
    _afterImg = [[UIImageView alloc] init];
    [self addSubview:_afterImg];
    
    _currentImg.image = [UIImage imageWithContentsOfFile:self.imageArr[0]];
    _afterImg.image = [UIImage imageWithContentsOfFile:self.imageArr[1]];
}
//时刻监听方向的改变
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetX = scrollView.contentOffset.x;
    self.direction = offsetX > QYScreenW ? 1 : offsetX < QYScreenW ? 2 : 0;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    NSInteger direction = [change[NSKeyValueChangeNewKey] integerValue];
    if (direction == 0)return;//无滑动
    else if (direction == 1){//左滑
         _afterImg.frame = CGRectMake(QYScreenW*2, 0, QYScreenW, 200);//左滑 afterimageView 在 currentImageView 的右边
        _afterIndex = (_currentIndex+1)% self.imageArr.count;
    }
    else if (direction == 2){//右滑
        _afterImg.frame = CGRectMake(0, 0, QYScreenW, 200);//右滑afterimageView 在 currentImageView 的左边
        _afterIndex = (_currentIndex-1)<0 ? self.imageArr.count-1 : _currentIndex-1;
    }
    _afterImg.image = [UIImage imageWithContentsOfFile:self.imageArr[_afterIndex]];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (self.direction == 0) return;//无滑动直接返回
    _currentIndex = _afterIndex;//将afterImageView的afterIndex 给 currentIndex, 即可完成索引的更新
    _currentImg.image = _afterImg.image;//将afterimageView 的图片给 currentImageView, 即可完成图片的更新
    scrollView.contentOffset = CGPointMake(QYScreenW, 0);//再次设置偏移
}
- (void)dealloc{
    [self removeObserver:self forKeyPath:@"direction" context:nil];
}
@end
