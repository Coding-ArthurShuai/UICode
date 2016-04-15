//
//  LSTGModal.h
//  LSTGWithXib
//
//  Created by qingyun on 16/4/11.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSTGModal : NSObject
@property (nonatomic,strong)NSString *buycount;
@property (nonatomic,strong)NSString *icon;
@property (nonatomic,strong)NSString *price;
@property (nonatomic,strong)NSString *title;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)modelWithDictionary:(NSDictionary *)dict;
@end
