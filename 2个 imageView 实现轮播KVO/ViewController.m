//
//  ViewController.m
//  LSTableViewControllerHomeWork
//
//  Created by qingyun on 16/4/9.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "LSTableView.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)LSTableView *tableView;

@property (nonatomic)BOOL isEditing;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LSTableView *tableView = [[LSTableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    _tableView = tableView;

    UIBarButtonItem *leftBarBtnItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editChange:)];
    leftBarBtnItem.tintColor = [UIColor blackColor];
    self.navigationItem.leftBarButtonItem = leftBarBtnItem;
    
    UIBarButtonItem *rightBarBtnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemSearch target:self action:nil];
    rightBarBtnItem.tintColor = [UIColor redColor];
    self.navigationItem.rightBarButtonItem = rightBarBtnItem;
    
}

- (void)editChange:(UITabBarItem *)sender{
    _tableView.editing = _tableView.isEditing ? NO : YES;
    sender.title = _tableView.isEditing ? @"完成" : @"编辑";
    self.navigationItem.leftBarButtonItem.tintColor = _tableView.isEditing ? [UIColor redColor] : [UIColor blackColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
