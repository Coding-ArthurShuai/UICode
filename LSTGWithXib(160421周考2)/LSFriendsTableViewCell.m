//
//  LSFriendsTableViewCell.m
//  LSTGWithXib
//
//  Created by qingyun on 16/4/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSFriendsTableViewCell.h"
#import "LSFriendsModal.h"
#import "LSFriendsSectionModal.h"

@implementation LSFriendsTableViewCell
- (void)setModal:(LSFriendsModal *)modal{
    _modal = modal;
    if (_sectionModal.isOpening) {
        self.imageView.image = [UIImage imageNamed:modal.icon];
        self.textLabel.text = modal.name;
        self.detailTextLabel.text = modal.status;
        if (modal.vip) {
            self.textLabel.textColor = [UIColor redColor];
            self.detailTextLabel.textColor = [UIColor redColor];
        }else{
            self.textLabel.textColor = [UIColor blackColor];
            self.detailTextLabel.textColor = [UIColor blackColor];
        }
    }
    
}
@end
