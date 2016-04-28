//
//  LSCollectionViewController.m
//  LSUITest160428
//
//  Created by qingyun on 16/4/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSCollectionViewController.h"
#import "LSCollectionViewCellModal.h"
#import "CollectionViewCell.h"
#import "Masonry.h"

#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreenH [UIScreen mainScreen].bounds.size.height
@interface LSCollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSArray *appArr;
@property (nonatomic,strong) UICollectionViewFlowLayout *layout;
@end

@implementation LSCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
- (NSArray *)appArr{
    if (_appArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"careTest" ofType:@"plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *modals = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            LSCollectionViewCellModal *model = [[LSCollectionViewCellModal alloc] initWithDictionary:dict];
            [modals addObject:model];
        }
        _appArr = modals;
    }
    return _appArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(QYScreenW, 100);
    _layout = layout;
    
    layout.minimumLineSpacing = 0;
    layout.headerReferenceSize = CGSizeMake(0, 10);
    layout.footerReferenceSize = CGSizeMake(0, 10);
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [self.view addSubview:_collectionView];
    _collectionView.backgroundColor = [UIColor whiteColor];
    //设置数据源和代理
    _collectionView.dataSource = self;

    [_collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
}
- (void)updateViewConstraints{
    [super updateViewConstraints];
    
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.leading.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.trailing.mas_equalTo(0);
    }];
    _layout.itemSize = CGSizeMake(QYScreenW, 100);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.appArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.modal = self.appArr[indexPath.item];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
