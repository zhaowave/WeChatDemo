//
//  MeViewController.h
//  WeChatDemo
//
//  Created by wei zhao on 2016/11/15.
//  Copyright © 2016年 wei zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSArray *imageArray;
@end
