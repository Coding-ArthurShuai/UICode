//
//  ViewController.m
//  LSTableViewControllerHomeWork
//
//  Created by qingyun on 16/4/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "LSTableView.h"
#import "LSTableViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong)LSTableView *tableView;
@property (nonatomic)BOOL isEditing;
@property (nonatomic,strong)UISearchController *searchController;
@property (nonatomic,strong)NSMutableArray *arr;
@end

@implementation ViewController

- (UISearchController *)searchController{
    if (_searchController == nil) {
        LSTableViewController *tableViewController = [[LSTableViewController alloc] initWithStyle:UITableViewStylePlain];
        tableViewController.array = self.tableView.modalsArr;
        _searchController = [[UISearchController alloc] initWithSearchResultsController:tableViewController];
        _searchController.searchResultsUpdater = tableViewController;

        _searchController.dimsBackgroundDuringPresentation = YES;
        _searchController.hidesNavigationBarDuringPresentation = NO;
        
    }
    return _searchController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LSTableView *tableView = [[LSTableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    _tableView = tableView;

    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editChange:)];
    leftBarBtnItem.tintColor = [UIColor blackColor];
    
    UIBarButtonItem *leftBarBtnItem2 = [[UIBarButtonItem alloc] initWithTitle:@"刷新页面" style:UIBarButtonItemStylePlain target:self action:@selector(reloadCurrentPage)];
    leftBarBtnItem2.tintColor = [UIColor redColor];
    
    self.navigationItem.leftBarButtonItems = @[leftBarBtnItem,leftBarBtnItem2];
    
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemSearch target:self action:@selector(searchBarItemClick:)];
    rightBarBtnItem.tintColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = rightBarBtnItem;
    
    _arr = self.tableView.modalsArr;

}
- (void)editChange:(UITabBarItem *)sender{
    _tableView.editing = _tableView.isEditing ? NO : YES;
    sender.title = _tableView.isEditing ? @"完成" : @"编辑";
    self.navigationItem.leftBarButtonItem.tintColor = _tableView.isEditing ? [UIColor redColor] : [UIColor blackColor];
}
- (void)searchBarItemClick:(UIBarButtonItem *)sender{
    [self presentViewController:self.searchController animated:YES completion:nil];
}
- (void)reloadCurrentPage{
    self.tableView.modalsArr = _arr;
    [self.tableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
