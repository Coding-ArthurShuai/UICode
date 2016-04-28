//
//  LSTableViewController.h
//  LSTGWithXib
//
//  Created by qingyun on 16/4/15.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSTableViewController : UITableViewController<UISearchResultsUpdating>
@property (nonatomic,strong)NSArray *array;
@end
