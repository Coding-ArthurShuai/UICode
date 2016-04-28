//
//  Model.m
//  LS-应用程序管理MVC
//
//  Created by qingyun on 16/3/27.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Model.h"

@implementation Model
- (instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        _icon = dict[@"icon"];
        _name = dict[@"name"];
        _link = dict[@"link"];
    }
    return self;
}
+ (instancetype)modelWithDictionary:(NSDictionary *)dict{
    return [[Model alloc] initWithDictionary:dict];
}
@end
