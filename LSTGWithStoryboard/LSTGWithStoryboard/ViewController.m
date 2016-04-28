//
//  ViewController.m
//  LSTGWithStoryboard
//
//  Created by qingyun on 16/4/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "LSTGModal.h"
#import "LSTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSArray *modalsArr;
@end

@implementation ViewController
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.modalsArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.modal = self.modalsArr[indexPath.row];
    return cell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
