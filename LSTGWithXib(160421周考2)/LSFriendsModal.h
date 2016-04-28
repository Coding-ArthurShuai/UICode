//
//  LSFriendsModal.h
//  LSTGWithXib
//
//  Created by qingyun on 16/4/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSFriendsModal : NSObject
@property (nonatomic,strong)NSString *icon;
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *status;
@property (nonatomic)BOOL vip;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)modelWithDictionary:(NSDictionary *)dict;
@end
