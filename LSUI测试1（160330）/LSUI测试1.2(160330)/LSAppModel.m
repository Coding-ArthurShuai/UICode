//
//  LSAppModel.m
//  LSUI测试1
//
//  Created by qingyun on 16/3/30.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSAppModel.h"

@implementation LSAppModel
- (instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        _name = dict[@"name"];
        _title = dict[@"title"];
    }
    return self;
}
+ (instancetype)modelWithDictionary:(NSDictionary *)dict{
    return [[LSAppModel alloc] initWithDictionary:dict];
}
@end
