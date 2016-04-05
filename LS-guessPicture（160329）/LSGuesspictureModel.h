//
//  LSGuesspictureModel.h
//  LS-guessPicture
//
//  Created by qingyun on 16/3/26.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSGuesspictureModel : NSObject
@property (nonatomic,strong)NSString *answer;
@property (nonatomic,strong)NSString *icon;
@property (nonatomic,strong)NSString *title;
@property (nonatomic)NSUInteger length;
@property (nonatomic,strong)NSArray *options;
@property (nonatomic)BOOL isFinsh;//标识是否完成题目

- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)modelWithDictionary:(NSDictionary *)dict;
@end
