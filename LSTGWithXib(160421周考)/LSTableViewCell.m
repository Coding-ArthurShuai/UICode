//
//  LSTableViewCell.m
//  LSTGWithXib
//
//  Created by qingyun on 16/4/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSTableViewCell.h"
#import "LSTGModal.h"

@interface LSTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *priceLable;
@property (weak, nonatomic) IBOutlet UILabel *buycountLable;
@end
@implementation LSTableViewCell

- (void)setModal:(LSTGModal *)modal{
    _modal = modal;
    _imgView.image = [UIImage imageNamed:modal.icon];
    _titleLable.text = modal.title;
    _priceLable.text = modal.price;
    _buycountLable.text = modal.buycount;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
