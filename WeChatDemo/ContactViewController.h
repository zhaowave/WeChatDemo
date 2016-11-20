//
//  ContactViewController.h
//  WeChatDemo
//
//  Created by wei zhao on 2016/11/15.
//  Copyright © 2016年 wei zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FMDatabase.h"
@interface ContactViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableDictionary *dataDict;
@property (nonatomic, strong) NSMutableArray *indexArray;
@property (nonatomic, strong) UITableView *tableView;
@end
