//
//  ViewController.m
//  test
//
//  Created by qingyun on 16/4/15.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)UIImageView *avatarImgView;
@property (nonatomic,strong)UILabel *nickNameLable;
@property (nonatomic,strong)UIView *timesTampIndicator;
@property (nonatomic,strong)UILabel *timesTampLable;
@property (nonatomic,strong)UIImageView *contentImgView;
@property (nonatomic,strong)UIView *likeIndicator;
@property (nonatomic,strong)UILabel *likesLable;
@property (nonatomic,strong)UIButton *likeButton;
@property (nonatomic,strong)UIButton *commentButton;
@property (nonatomic,strong)UIButton *moreButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self addSubViews];
    
    [self setAutoresizingMask];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(self.view,_avatarImgView,_nickNameLable,_timesTampIndicator,_timesTampLable,_contentImgView,_likeIndicator,_likesLable,_likeButton,_commentButton,_moreButton);
    
    [self setLayout:views];
}
- (void)addSubViews{
    _avatarImgView = [[UIImageView alloc] initWithImage:nil];
    [self.view addSubview:_avatarImgView];
    _avatarImgView.backgroundColor = [UIColor redColor];
    _avatarImgView.layer.cornerRadius = 17.5;
    
    _nickNameLable = [[UILabel alloc] init];
    [self.view addSubview:_nickNameLable];
    _nickNameLable.text = @"dorayo";
    _nickNameLable.textColor = [UIColor blueColor];
    _nickNameLable.font = [UIFont boldSystemFontOfSize:23];
    [_nickNameLable sizeToFit];
    
    _timesTampIndicator = [[UIView alloc] init];
    [self.view addSubview:_timesTampIndicator];
    _timesTampIndicator.backgroundColor = [UIColor greenColor];
    
    _timesTampLable = [[UILabel alloc] init];
    [self.view addSubview:_timesTampLable];
    _timesTampLable.text = @"7小时";
    _timesTampLable.textColor = [UIColor grayColor];
    _timesTampLable.font = [UIFont boldSystemFontOfSize:23];
    [_timesTampLable sizeToFit];
    
    _contentImgView = [[UIImageView alloc] initWithImage:nil];
    [self.view addSubview:_contentImgView];
    _contentImgView.backgroundColor = [UIColor purpleColor];
    
    _likeIndicator = [[UIView alloc] init];
    [self.view addSubview:_likeIndicator];
    _likeIndicator.backgroundColor = [UIColor orangeColor];
    
    _likesLable = [[UILabel alloc] init];
    [self.view addSubview:_likesLable];
    _likesLable.text = @"12次赞";
    _likesLable.textColor = [UIColor blueColor];
    _likesLable.font = [UIFont boldSystemFontOfSize:23];
    [_likesLable sizeToFit];
    
    _likeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_likeButton];
    _likeButton.backgroundColor = [UIColor darkGrayColor];
    
    _commentButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_commentButton];
    _commentButton.backgroundColor = [UIColor cyanColor];
    
    _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_moreButton];
    _moreButton.backgroundColor = [UIColor magentaColor];
}
- (void)setAutoresizingMask{
    _avatarImgView.translatesAutoresizingMaskIntoConstraints = NO;
    _nickNameLable.translatesAutoresizingMaskIntoConstraints = NO;
    _timesTampIndicator.translatesAutoresizingMaskIntoConstraints = NO;
    _timesTampLable.translatesAutoresizingMaskIntoConstraints = NO;
    _contentImgView.translatesAutoresizingMaskIntoConstraints = NO;
    _likeIndicator.translatesAutoresizingMaskIntoConstraints = NO;
    _likesLable.translatesAutoresizingMaskIntoConstraints = NO;
    _likeButton.translatesAutoresizingMaskIntoConstraints = NO;
    _commentButton.translatesAutoresizingMaskIntoConstraints = NO;
    _moreButton.translatesAutoresizingMaskIntoConstraints = NO;
}
- (void)setLayout:(NSDictionary *)views{
    CGRect viewFrame = self.view.frame;
    NSDictionary *metrics = @{@"width":@(CGRectGetWidth(viewFrame))};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_avatarImgView(35)]-10-[_nickNameLable]-(>=0)-[_timesTampIndicator(10)]-10-[_timesTampLable]-10-|"  options:NSLayoutFormatAlignAllCenterY metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_avatarImgView(35)]-10-[_contentImgView]"  options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(>=0)-[_timesTampIndicator(10)]"  options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_contentImgView]|"  options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_contentImgView(width)]-10-[_likeIndicator(20)]"  options:0 metrics:metrics views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_likeIndicator(20)]-10-[_likesLable]"  options:NSLayoutFormatAlignAllCenterY metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[_likeButton(50)]-5-[_commentButton(60)]-(>=0)-[_moreButton(40)]-10-|"  options:NSLayoutFormatAlignAllCenterY metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_likeIndicator(20)]-20-[_likeButton(25)]"  options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_commentButton(25)]"  options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_moreButton(25)]"  options:0 metrics:nil views:views]];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
