//
//  CollectionViewCell.m
//  LSUITest160428
//
//  Created by qingyun on 16/4/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "CollectionViewCell.h"
#import "LSCollectionViewCellModal.h"

@interface CollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *titlelabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@end
@implementation CollectionViewCell

- (void)setModal:(LSCollectionViewCellModal *)modal{
    _modal = modal;
    _imgView.image = [UIImage imageNamed:modal.Img];
    _titlelabel.text = modal.title;
    _descLabel.text = modal.desc;
}

@end
