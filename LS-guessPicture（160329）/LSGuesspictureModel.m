//
//  LSGuesspictureModel.m
//  LS-guessPicture
//
//  Created by qingyun on 16/3/26.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "LSGuesspictureModel.h"

@implementation LSGuesspictureModel
- (instancetype)initWithDictionary:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        _length = _answer.length;
    }
    return self;
}
+ (instancetype)modelWithDictionary:(NSDictionary *)dict{
    return [[LSGuesspictureModel alloc] initWithDictionary:dict];
}
@end
