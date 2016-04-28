//
//  LSTabView.m
//  LSLOLHomeWork
//
//  Created by qingyun on 16/4/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSTabView.h"
#import "LSLOLModal.h"

@interface LSTabView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)NSArray *modalsArr;

@end
@implementation LSTabView
- (NSArray *)modalsArr{
    if (_modalsArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"hero" ofType:@"plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arr0 = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            LSLOLModal *modal = [LSLOLModal modelWithDictionary:dict];
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
        
        self.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        self.showsVerticalScrollIndicator = NO;
        self.sectionHeaderHeight = 50;
        self.rowHeight = 80;
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.modalsArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger numb = 0;
     LSLOLModal *modal = self.modalsArr[section];
    if (modal.isOpening == YES) {
        numb = modal.friends.count;
    }
    return numb;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    LSLOLModal *modal = self.modalsArr[section];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30)];
    view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [view addSubview:btn];
    btn.frame = CGRectMake(2, 13, 20, 20);
    [btn setImage:[UIImage imageNamed:@"right"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"down"] forState:UIControlStateSelected];
    btn.tag = section+1;
    [btn addTarget:self action:@selector(openOrCloseCellcontent:) forControlEvents:UIControlEventTouchUpInside];
    if (modal.isOpening == YES) {//确保下次 reloadData 后,状态保持
        btn.selected = YES;
    }

    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(25, 9, 80, 30)];
    [view addSubview:titleLable];
    titleLable.text = modal.name;
    titleLable.textAlignment = NSTextAlignmentCenter;
    titleLable.font = [UIFont boldSystemFontOfSize:20];
    
    UILabel *onlineLable = [[UILabel alloc] initWithFrame:CGRectMake(320, 10, 80, 30)];
    [view addSubview:onlineLable];
    NSString *onlineNub = [NSString stringWithFormat:@"%ld/%ld",modal.online,modal.friends.count];
    onlineLable.text = onlineNub;
    onlineLable.textAlignment = NSTextAlignmentCenter;
    onlineLable.font = [UIFont boldSystemFontOfSize:20];
    return view;
}
- (void)openOrCloseCellcontent:(UIButton *)sender{
    LSLOLModal *modal = self.modalsArr[sender.tag-1];

    sender.selected = !sender.selected;
    modal.isOpening = !modal.isOpening;
    
    [self reloadData];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:indentifier];
    }
    LSLOLModal *modal = self.modalsArr[indexPath.section];
    NSDictionary *dict = modal.friends[indexPath.row];
    if (modal.isOpening == YES) {
        cell.imageView.image = [UIImage imageNamed:dict[@"icon"]];
        cell.textLabel.text = dict[@"name"];
        cell.detailTextLabel.text = dict[@"intro"];
        
        NSNumber *nub = dict[@"vip"];
        NSInteger vipNub = [nub intValue];
        if (vipNub == 1) {
            cell.textLabel.textColor = [UIColor redColor];
            cell.detailTextLabel.textColor = [UIColor redColor];
        }else if (vipNub == 0){
            cell.textLabel.textColor = [UIColor blackColor];
            cell.detailTextLabel.textColor = [UIColor blackColor];
        }
    }
    return cell;
}
@end
