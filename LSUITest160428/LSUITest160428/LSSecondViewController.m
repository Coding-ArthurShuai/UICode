//
//  LSSecondViewController.m
//  LSUITest160428
//
//  Created by qingyun on 16/4/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSSecondViewController.h"

@interface LSSecondViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation LSSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     _textView.delegate = self;
    
    NSRange boldRange = [_textView.text rangeOfString:_textView.text];
    NSRange bgRange = [_textView.text rangeOfString:@"exercitation"];
    NSRange colorRange = [_textView.text rangeOfString:@"voluptate"];
    
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:_textView.attributedText];
    
    [mutableAttributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:25] range:boldRange];
    [mutableAttributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor redColor] range:bgRange];
    [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:colorRange];
    
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = [UIImage imageNamed:@"new_feature_7"];
    NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attachment];
    [mutableAttributedString appendAttributedString:attachString];
    _textView.attributedText = mutableAttributedString;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyBoardAction:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyBoardAction:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)handleKeyBoardAction:(NSNotification *)notification {
    CGRect beginFrame = [notification.userInfo[UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    CGRect endFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat detalY = endFrame.origin.y - beginFrame.origin.y;
    CGRect frame = _textView.frame;
    frame.size.height += detalY;
    _textView.frame = frame;
}
-(void)textViewDidBeginEditing:(UITextView *)textView {
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(finishAction)];
    self.navigationItem.rightBarButtonItem = doneItem;
}

-(void)finishAction{
    [_textView resignFirstResponder];
    self.navigationItem.rightBarButtonItem = nil;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
