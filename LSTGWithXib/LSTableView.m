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

@interface LSTableView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSArray *modalsArr;

@end
@implementation LSTableView
static NSString *indentfier = @"cell";
- (NSArray *)modalsArr{
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
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        self.dataSource = self;
        self.delegate = self;
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.showsVerticalScrollIndicator = NO;
        self.rowHeight = 120;
        
        [self registerNib:[UINib nibWithNibName:NSStringFromClass([LSTableViewCell class]) bundle:nil]  forCellReuseIdentifier:indentfier];
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modalsArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentfier];
    cell.modal = self.modalsArr[indexPath.row];
    return cell;
}
@end
