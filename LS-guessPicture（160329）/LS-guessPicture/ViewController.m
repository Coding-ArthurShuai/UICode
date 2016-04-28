//
//  ViewController.m
//  LS-guessPicture
//
//  Created by qingyun on 16/3/26.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#import "LSGuesspictureModel.h"
#import "LSoptionView.h"
#import "LSanswerView.h"

@interface ViewController ()
{
    int _index;//定义切换图片时的遍历索引
    BOOL _isHint;//标识是否被提示过
    int _pass;//标识答对的题的个数
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *optionTitle;
@property (weak, nonatomic) IBOutlet UILabel *nobLable;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

@property (nonatomic,strong)LSanswerView *answerView;
@property (nonatomic,strong)LSoptionView *optionView;

@property (nonatomic,strong)NSArray *apps;//定义model数据数组

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self reveal];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//懒加载数据数组
- (NSArray *)apps{
    if (_apps == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"questions" ofType:@"plist"];
        _apps = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dict in _apps) {
            LSGuesspictureModel *model = [[LSGuesspictureModel alloc] initWithDictionary:dict];
            [arr addObject:model];
        }
        _apps = arr;
    }
    return _apps;
}
//主显示方法
- (void)reveal{
    if (_index == self.apps.count) {//图片循环重置
        _index = 0;
    }
    
    _nobLable.text = [NSString stringWithFormat:@"%d/%ld",_index+1,self.apps.count];
    _optionTitle.text = [self.apps[_index] title];
    LSGuesspictureModel *model = self.apps[_index];
    _imageView.image = [UIImage imageNamed:model.icon];
    
    //添加option区模块
    [_optionView removeFromSuperview];
    LSoptionView *optionView = [LSoptionView optionView];
    [self.view addSubview:optionView];
     optionView.frame = CGRectMake(25, 475,0,0);
    [optionView setOptionWith:model.options];
    _optionView = optionView;
    
    __weak ViewController *weakSelf = self;
    optionView.optionBlk = ^(UIButton *optionBtn){
        [weakSelf optionChoose:optionBtn];
    };
    
    //添加answer区模块
    [_answerView removeFromSuperview];
    LSanswerView *answerView = [LSanswerView answerWithAnswerLength:model.length];
    [self.view addSubview:answerView];
    answerView.frame = CGRectMake(0, 390, 0, 0);
    _answerView = answerView;
    
    answerView.answerBlk = ^(UIButton *answerBtn){
        [weakSelf backChange:answerBtn];
    };
    
    //完成题目后，下次显示时，不用再输answer
    [self finshImageQuestion];
}
//功能按键触发
- (IBAction)click:(UIButton *)sender {
    switch (sender.tag) {
        case 100://提示
            [self hint];
            break;
        case 101://放大图
            [self largeImage];
            break;
        case 102:
            {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示！！！" message:@"此游戏输入正确答案方可进入自动下一题，\n所有答案填充完毕后，才能进入下一关。\n作者：ArthurShuai\n版权所有，翻版必究！！！" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"是否继续？" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
            }
            break;
        case 103://下一题
            [self nextImage];
            break;
            
        default:
            break;
    }
}
//下一题
- (void)nextImage{
    _isHint = NO;
    _index++;
    [self.view viewWithTag:103].userInteractionEnabled = YES;//避免回答正确进入下一题时，“下一题”按键无响应
    [self reveal];
}
//完成题目后，下次显示时，不用再输answer
- (void)finshImageQuestion{
    LSGuesspictureModel *model = self.apps[_index];
    if (model.isFinsh == YES) {
        for (UIButton *answerBtn in _answerView.subviews) {
            NSString *temp = [NSString string];
            NSUInteger i = [_answerView.subviews indexOfObject:answerBtn];//取出answerBtn对应在父视图中的索引位置
            temp = [model.answer substringWithRange:NSMakeRange(i, 1)];
            [answerBtn setTitle:temp forState:UIControlStateNormal];
            [answerBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        }
        _optionView.userInteractionEnabled = NO;
        _answerView.userInteractionEnabled = NO;
    }
    //判断是否通关
    if (_pass == self.apps.count) {
        [self allFinsh];
        _pass = 0;
    }
}
//判断是否通关
- (void)allFinsh{
    __weak ViewController *weakSelf = self;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"恭喜！！！" message:@"你已通关！是否继续？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        for (int i=0; i<self.apps.count; i++) {
            LSGuesspictureModel *model0 = self.apps[i];
            model0.isFinsh = 0;
            _index = 0;
            _moneyLabel.text = @"10000";
            [weakSelf reveal];
        }
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:action1];
    [alert addAction:action2];
    [self presentViewController:alert animated:YES completion:nil];
}
//提示显示
- (void)hint{
    LSGuesspictureModel *model = self.apps[_index];
    int money = [_moneyLabel.text intValue];
    if (money >= 1000) {
        for (UIButton *answerBtn in _answerView.subviews)
        {
            NSString *temp = [NSString string];//提示答案
            NSUInteger i = [_answerView.subviews indexOfObject:answerBtn];//取出answerBtn对应在父视图中的索引位置
            temp = [model.answer substringWithRange:NSMakeRange(i, 1)];
            if (![answerBtn.currentTitle isEqualToString:temp]) {//判断当前answer区当前位置的答案是否正确，避免重复提示
                _isHint = YES;
                
                money -= 1000;
                NSString *str = [@(money) stringValue];
                _moneyLabel.text = str;//金币更新
                
                [_optionView viewWithTag:answerBtn.tag].hidden = NO;//若当前答案区有错误输入，在变成正确答案的前，在option区恢复
                for (UIButton *optionBtn in _optionView.subviews) {//找到option区对应位置的字，输入后隐藏
                    if ([optionBtn.currentTitle isEqualToString:temp]) {
                        optionBtn.hidden = YES;
                        answerBtn.tag = optionBtn.tag;
                        break;
                    }
                }
                [answerBtn setTitle:temp forState:UIControlStateNormal];
                [answerBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];//提示答案在answer区显示,并标记为蓝色字体
                answerBtn.userInteractionEnabled = NO;//调控，提示输入answer后，不可点击
                if ([_answerView.subviews indexOfObject:answerBtn] == _answerView.subviews.count -1) {//到最后一个answer输入完后，自动判断answer是否正确
                    [self answerSure];
                }
                break;//避免一次性将answer区填写完，实现一个一个提示填写
            }
        }
    }
    else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"金币不足！请充值！！！" message:@"建议使用青云Pay支付，优惠多多" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            _moneyLabel.text = @"10000";
        }];
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:action1];
        [alert addAction:action2];
        [self presentViewController:alert animated:YES completion:nil];
    }
}
//放大图
- (void)largeImage{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = [UIScreen mainScreen].bounds;
    btn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn];
    [self.view bringSubviewToFront:_imageView];
    [btn addTarget:self action:@selector(theFirstImage:) forControlEvents:UIControlEventTouchUpInside];
    [UIView animateWithDuration:0.8 animations:^{
        _imageView.transform = CGAffineTransformScale(self.view.transform,1.2,1.2);
        btn.alpha = 0.66;
    }];
}
//结束放大图后回到原图
- (void)theFirstImage:(UIButton *)sender{
    [sender removeFromSuperview];
    [UIView animateWithDuration:0.8 animations:^{
        _imageView.transform = CGAffineTransformIdentity;
    }];
}
//option触发事件
- (void)optionChoose:(UIButton *)sender{
    for (UIButton *answerBtn in _answerView.subviews) {//遍历answer区
        if (answerBtn.tag == 0 && answerBtn.currentTitle == nil) {//如果当前answer区的tag为0，即没有值，给answer区赋值(主要是避免将提示的answer遮盖)
            [answerBtn setTitle:sender.titleLabel.text forState:UIControlStateNormal];
            [answerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            answerBtn.tag = sender.tag;//令显示的答案按钮的tag值与sender的tag相等，以便进答案区进行回退时，可以准确找到sender的原位置
            sender.hidden = YES;
            if ([_answerView.subviews indexOfObject:answerBtn] == _answerView.subviews.count -1) {//到最后一个answer输入完后，自动判断answer是否正确
                [self answerSure];
            }
            break;//避免一次性将answer区填写完，实现一个一个填写
        }
    }
}
//answer区触发事件
- (void)backChange:(UIButton *)sender{
    if (sender.currentTitle != nil) {
        [sender setTitle:nil forState:UIControlStateNormal];
        UIButton *optionBtn = [_optionView viewWithTag:sender.tag];//通过相同的Tag，直接找到option区的按钮
        optionBtn.hidden = NO;
        sender.tag = 0;
    }
}
//判断是否输入正确,正确后调整下一题,字体变成绿色，错误变成红色
- (void)answerSure{
    LSGuesspictureModel *model = self.apps[_index];
    NSMutableString *str = [NSMutableString stringWithCapacity:model.length];
    for (UIButton *answerBtn in _answerView.subviews) {
        [str appendString:answerBtn.currentTitle];
    }
    if ([str isEqualToString:model.answer]) {
        [self performSelector:@selector(nextImage) withObject:nil afterDelay:0.66];//延迟切换下一题
        [self.view viewWithTag:103].userInteractionEnabled = NO;//切换一下题时，避免按键“下一题”操作
        //当answer区输入正确后，在切换图片时，次题会直接显示answer，且不能再进行输入和answer区回退，但可以放大图
        model.isFinsh = YES;
        _pass++;
        if (_isHint == NO) {//没有提示过，金币会更新
            int money = [_moneyLabel.text intValue];
            money += 1000;
            NSString *str = [@(money) stringValue];
            _moneyLabel.text = str;
        }
        for (UIButton *answerBtn in _answerView.subviews) {
            [answerBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        }
    }
    else{
        for (UIButton *answerBtn in _answerView.subviews) {
            [answerBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
    }
}
@end
