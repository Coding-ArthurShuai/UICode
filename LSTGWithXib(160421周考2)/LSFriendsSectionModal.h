//
//  LSFriendsSectionModal.h
//  LSTGWithXib
//
//  Created by qingyun on 16/4/21.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSFriendsSectionModal : NSObject
@property (nonatomic,strong)NSMutableArray *friends;
@property (nonatomic,strong)NSString *name;
@property (nonatomic)NSInteger online;
@property (nonatomic)BOOL isOpening;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)modelWithDictionary:(NSDictionary *)dict;
@end
