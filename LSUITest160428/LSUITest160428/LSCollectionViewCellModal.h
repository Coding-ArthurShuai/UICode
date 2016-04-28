//
//  LSCollectionViewCellModal.h
//  LSUITest160428
//
//  Created by qingyun on 16/4/28.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LSCollectionViewCellModal : NSObject
@property (nonatomic,strong)NSString *Img;
@property (nonatomic,strong)NSString *title;
@property (nonatomic,strong)NSString *desc;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
+ (instancetype)modelWithDictionary:(NSDictionary *)dict;
@end
