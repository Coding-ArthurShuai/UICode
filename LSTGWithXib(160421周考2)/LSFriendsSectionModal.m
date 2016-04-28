//
//  LSFriendsModal.m
//  LSTGWithXib
//
//  Created by qingyun on 16/4/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSFriendsSectionModal.h"

@implementation LSFriendsSectionModal
- (instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        _friends = [NSMutableArray arrayWithArray:dict[@"friends"]];
        _name = dict[@"name"];
        _online = [dict[@"online"] integerValue];
    }
    return self;
}
+ (instancetype)modelWithDictionary:(NSDictionary *)dict{
    return [[self alloc] initWithDictionary:dict];
}
@end
