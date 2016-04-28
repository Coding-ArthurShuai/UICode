//
//  LSFriendsTableViewCell.h
//  LSTGWithXib
//
//  Created by qingyun on 16/4/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LSFriendsModal,LSFriendsSectionModal;
@interface LSFriendsTableViewCell : UITableViewCell
@property (nonatomic,strong)LSFriendsModal *modal;
@property (nonatomic,strong)LSFriendsSectionModal *sectionModal;
@end
