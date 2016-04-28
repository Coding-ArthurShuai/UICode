//
//  LSFriendsTableViewController.m
//  LSTGWithXib
//
//  Created by qingyun on 16/4/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSFriendsTableViewController.h"
#import "LSFriendsSectionModal.h"
#import "LSFriendsModal.h"
#import "LSFriendsTableViewCell.h"

@interface LSFriendsTableViewController ()<UISearchBarDelegate>
@property (nonatomic,strong) NSMutableArray *stModalsArr;
@property (nonatomic,strong) UISearchBar    *searchBar;
@property (nonatomic,strong) NSMutableArray *results;
@property (nonatomic       ) BOOL           isSearching;
@end
@implementation LSFriendsTableViewController
- (NSMutableArray *)stModalsArr{
    if (_stModalsArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"friends" ofType:@"plist"];
        NSArray *arr = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arr0 = [NSMutableArray array];
        for (NSDictionary *dict in arr) {
            LSFriendsSectionModal *modal = [LSFriendsSectionModal modelWithDictionary:dict];
            [arr0 addObject:modal];
        }
        _stModalsArr = arr0;
    }
    return _stModalsArr;
}
- (UISearchBar *)searchBar{
    if (_searchBar == nil) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 44)];
        _searchBar.delegate = self;
    }
    return _searchBar;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.sectionHeaderHeight = 50;
    self.tableView.rowHeight = 80;
    
    self.tableView.tableHeaderView = self.searchBar;
    
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editChange:)];
    rightBarBtnItem.tintColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = rightBarBtnItem;
}
- (void)editChange:(UITabBarItem *)sender{
    self.tableView.editing = self.tableView.isEditing ? NO : YES;
    sender.title = self.tableView.isEditing ? @"完成" : @"编辑";
    self.navigationItem.leftBarButtonItem.tintColor = self.tableView.isEditing ? [UIColor redColor] : [UIColor blackColor];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _isSearching ? 1 : self.stModalsArr.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger numb = 0;
    LSFriendsSectionModal *modal = self.stModalsArr[section];
    if (_isSearching) {
        return _results.count;
    }else{
        if (modal.isOpening) {
            numb = modal.friends.count;
        }
        return numb;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    LSFriendsSectionModal *modal = self.stModalsArr[section];
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
    
    UILabel *titleLable = [[UILabel alloc] initWithFrame:CGRectMake(25, 9, 120, 30)];
    [view addSubview:titleLable];
    titleLable.text = modal.name;
    titleLable.textAlignment = NSTextAlignmentLeft;
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
    LSFriendsSectionModal *modal = self.stModalsArr[sender.tag-1];
    
    sender.selected = !sender.selected;
    modal.isOpening = !modal.isOpening;
    
    [self.tableView reloadData];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentifier = @"cell";
    LSFriendsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    if (cell == nil) {
        cell = [[LSFriendsTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:indentifier];
    }
    LSFriendsSectionModal *modal = self.stModalsArr[indexPath.section];
    if (_isSearching) {
        NSDictionary *dict = _results[indexPath.row];
        LSFriendsModal *fModal = [LSFriendsModal modelWithDictionary:dict];
        cell.sectionModal = modal;
        cell.modal = fModal;
    }else{
        NSDictionary *dict = modal.friends[indexPath.row];
        LSFriendsModal *fModal = [LSFriendsModal modelWithDictionary:dict];
        cell.sectionModal = modal;
        cell.modal = fModal;
    }
    return cell;
}
//开始编辑搜索框
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    searchBar.showsCancelButton = YES;
}
//点击取消按钮
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    searchBar.showsCancelButton = NO;
    [searchBar resignFirstResponder];
    searchBar.text = nil;
    _isSearching = NO;
    [self.tableView reloadData];
}
//点击搜索按钮
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    searchBar.showsCancelButton = NO;
}
//搜索框文本已经改变,即已经开始输入搜索
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchBar.text.length == 0) {//搜索框被清空
        _isSearching = NO;
        [self.tableView reloadData];
        return;
    }
    //正常搜索
    _isSearching = YES;
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF.name CONTAINS[CD] %@",searchText];
    NSMutableArray *arr = [NSMutableArray array];
    for (LSFriendsSectionModal *modal in self.stModalsArr) {
        NSArray *temp = [modal.friends filteredArrayUsingPredicate:pred];
        [arr addObjectsFromArray:temp];
    }
    _results = arr;
    [self.tableView reloadData];
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (UITableViewCellEditingStyle) tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    LSFriendsSectionModal *modal = self.stModalsArr[indexPath.section];
    [modal.friends removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
}
@end
