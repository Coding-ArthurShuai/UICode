//
//  LSAppModel.h
//  LSUI测试1
//
//  Created by qingyun on 16/3/30.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSAppModel : NSObject

@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *title;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)modelWithDictionary:(NSDictionary *)dict;

@end
