//
//  LSLOLModal.h
//  LSLOLHomeWork
//
//  Created by qingyun on 16/4/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSLOLModal : NSObject

@property (nonatomic,strong)NSArray *friends;
@property (nonatomic,strong)NSString *name;
@property (nonatomic)NSInteger online;
@property (nonatomic)BOOL isOpening;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)modelWithDictionary:(NSDictionary *)dict;
@end
