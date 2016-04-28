//
//  ViewController.m
//  LSUITest160428
//
//  Created by qingyun on 16/4/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"


#define QYScreenW [UIScreen mainScreen].bounds.size.width
#define QYScreenH [UIScreen mainScreen].bounds.size.height
#define ImageCount 6
@interface ViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic)UIScrollView *scrollView;
@property (strong, nonatomic)UIImageView *firstView;
@property (strong, nonatomic)UIImageView *secondView;
@property (strong, nonatomic)UIImageView *thirdView;
@property (nonatomic,strong)NSArray *imageArr;
@property (nonatomic)NSInteger index;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (weak, nonatomic) IBOutlet UILabel *pickerLabel;
@end

@implementation ViewController
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
- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView =[[UIScrollView alloc] initWithFrame:CGRectMake(0, 65, QYScreenW, 200)];
    [self.view addSubview:_scrollView];
    _scrollView.contentSize = CGSizeMake(QYScreenW * 3, 200);
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces= NO;
    _scrollView.backgroundColor = [UIColor blackColor];
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    
    for (int i=0; i<3; i++) {
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(QYScreenW*i, 0, QYScreenW, 200)];
        [_scrollView addSubview:img];
        img.tag = i+100;
    }
    [self configurationImageForScrollViews];
    
 
    NSDate *date = [NSDate date];
    NSDate *minDate = [date dateByAddingTimeInterval: -(60 * 60 * 24 * 30)];
    _datePicker.minimumDate = minDate;

    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *compenents = [[NSDateComponents alloc] init];
    compenents.year = 2016;
    compenents.month = 5;
    compenents.day = 30;
    compenents.hour = 12;
    compenents.minute = 12;
    compenents.second = 12;
 
    NSDate *maxDate = [calendar dateFromComponents:compenents];
    _datePicker.maximumDate = maxDate;
    
    [_datePicker addTarget:self action:@selector(datePickerValueChanged:) forControlEvents:UIControlEventValueChanged];
}
-(void)datePickerValueChanged:(UIDatePicker *)datePicker {
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    NSInteger interval = [timeZone secondsFromGMTForDate:datePicker.date];
    NSDate *currentDate = [datePicker.date dateByAddingTimeInterval:interval];
    
    _pickerLabel.text = [NSString stringWithFormat:@"%@",currentDate];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:[NSString stringWithFormat:@"%@",currentDate] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {}];
    [alertController addAction:action];
    [self presentViewController:alertController animated:YES completion:nil];
}
-(void)configurationImageForScrollViews{
    _firstView = [_scrollView viewWithTag:100];
    _secondView = [_scrollView viewWithTag:101];
    _thirdView = [_scrollView viewWithTag:102];
    
    NSInteger leftIndex = [self enableForIndex:(_index - 1)];
    _firstView.image = [UIImage imageWithContentsOfFile:self.imageArr[leftIndex]];
    
    NSInteger middleIndex = [self enableForIndex:(_index)];
    _secondView.image = [UIImage imageWithContentsOfFile:self.imageArr[middleIndex]];
    
    NSInteger rightIndex = [self enableForIndex:(_index + 1)];
    _thirdView.image = [UIImage imageWithContentsOfFile:self.imageArr[rightIndex]];
    
    [_scrollView setContentOffset:CGPointMake(QYScreenW, 0)];
}
-(NSInteger)enableForIndex:(NSInteger)index {
    if (index < 0) {
        return self.imageArr.count - 1;
    }else{
        return index % (self.imageArr.count);
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x == 0) {//右滑动
        _index--;
    }else if (scrollView.contentOffset.x == QYScreenW * 2) {//左滑动
        _index++;
    }
    //保证_currentIndex合法
    _index = [self enableForIndex:_index];
    
    [self configurationImageForScrollViews];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
