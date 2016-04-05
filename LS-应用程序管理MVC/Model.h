//
//  Model.h
//  LS-应用程序管理MVC
//
//  Created by qingyun on 16/3/27.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property (nonatomic,strong)NSString *icon;
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *link;

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)modelWithDictionary:(NSDictionary *)dict;
@end
