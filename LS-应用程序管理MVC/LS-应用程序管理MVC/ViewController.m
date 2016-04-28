//
//  ViewController.m
//  LS-应用程序管理MVC
//
//  Created by qingyun on 16/3/27.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"
#import "AppView.h"

@interface ViewController ()
@property (nonatomic,strong)NSArray *appsArr;
@end

@implementation ViewController

- (NSArray *)appsArr{
    if (_appsArr == nil) {
        NSString *str = [[NSBundle mainBundle] pathForResource:@"apps" ofType:@"plist"];
        _appsArr = [NSArray arrayWithContentsOfFile:str];
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dict in _appsArr) {
            Model *model = [[Model alloc] initWithDictionary:dict];
            [arr addObject:model];
        }
        _appsArr = arr;
    }
    return _appsArr;
}
- (void)appManage{
    int totalColumn = 4;
    CGFloat viewW = 80;
    CGFloat viewH = 90;
    //appView左右和上下间距
    CGFloat viewSpaceX = ([UIScreen mainScreen].bounds.size.width-viewW*totalColumn)/(totalColumn + 1);
    CGFloat viewSpaceY = 30;
    for (int i=0; i<self.appsArr.count; i++) {
        int row = i/totalColumn;
        int column = i%totalColumn;
        CGFloat viewX = viewW*column +viewSpaceX*(column+1);
        CGFloat viewY = viewH*row + viewSpaceY*(row+1);
        AppView *appView = [AppView appView];
        appView.frame = CGRectMake(viewX, viewY, viewW, viewH);
        [self.view addSubview:appView];
        appView.viewController = self;
        
        Model *model = self.appsArr[i];
        appView.model = model;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self appManage];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
