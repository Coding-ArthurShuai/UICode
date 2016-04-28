//
//  LSTableView.m
//  LSTGWithXib
//
//  Created by qingyun on 16/4/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSTableView.h"
#import "LSTGModal.h"
#import "LSTableViewCell.h"

#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreenH [UIScreen mainScreen].bounds.size.height
#define ImageCount 6
@interface LSTableView ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView *scrollView;
@property (nonatomic,strong)NSArray *imageArr;
@property (nonatomic)NSInteger index;

@end
@implementation LSTableView
static NSString *indentfier = @"cell";
- (NSMutableArray *)modalsArr{
    if (_modalsArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arr0 = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            LSTGModal *modal = [LSTGModal modelWithDictionary:dict];
            [arr0 addObject:modal];
        }
        _modalsArr = arr0;
    }
    return _modalsArr;
}
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
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        self.dataSource = self;
        self.delegate = self;
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.showsVerticalScrollIndicator = NO;
        self.rowHeight = 120;
        
        [self makeScrollView];
        [self addScrollView];
        [self configurationImageForScrollViews];
        
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([LSTableViewCell class]) bundle:nil]  forCellReuseIdentifier:indentfier];
    }
    return self;
}
- (void)makeScrollView{
    _scrollView =[[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, QYScreenW, 200)];
    self.tableHeaderView = _scrollView;
    
    _scrollView.contentSize = CGSizeMake(QYScreenW * 3, 200);
    _scrollView.pagingEnabled = YES;
    _scrollView.backgroundColor = [UIColor blackColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
}
- (void)addScrollView{
    for (int i=0; i<3; i++) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(QYScreenW*i, 0, QYScreenW, 200)];
        [_scrollView addSubview:img];
        img.tag = i+100;
    }
}

-(NSInteger)enableForIndex:(NSInteger)index {
    if (index < 0) {
        return self.imageArr.count - 1;
    }else{
        return index % (self.imageArr.count);
    }
}

-(void)configurationImageForScrollViews{
    UIImageView *leftImg = [_scrollView viewWithTag:100];
    UIImageView *middleImg = [_scrollView viewWithTag:101];
    UIImageView *rightImg = [_scrollView viewWithTag:102];
    
    NSInteger leftIndex = [self enableForIndex:(_index - 1)];
    leftImg.image = [UIImage imageWithContentsOfFile:self.imageArr[leftIndex]];
    
    NSInteger middleIndex = [self enableForIndex:(_index)];
    middleImg.image = [UIImage imageWithContentsOfFile:self.imageArr[middleIndex]];
    
    NSInteger rightIndex = [self enableForIndex:(_index + 1)];
    rightImg.image = [UIImage imageWithContentsOfFile:self.imageArr[rightIndex]];
    
    [_scrollView setContentOffset:CGPointMake(QYScreenW, 0)];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self) {
        return;
    }
    if (scrollView.contentOffset.x == 0) {//右滑动
        _index--;
    }else if (scrollView.contentOffset.x == QYScreenW * 2) {//左滑动
        _index++;
    }
    //保证_currentIndex合法
    _index = [self enableForIndex:_index];
    
    [self configurationImageForScrollViews];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modalsArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentfier];
    cell.modal = self.modalsArr[indexPath.row];
    return cell;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}
- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.modalsArr removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
}
@end
