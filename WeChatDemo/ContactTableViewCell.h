//
//  ContactTableViewCell.h
//  WeChatDemo
//
//  Created by wei zhao on 2016/11/18.
//  Copyright © 2016年 wei zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendItem.h"

@interface ContactTableViewCell : UITableViewCell
@property (nonatomic, strong) FriendItem *friendItem;
@property (nonatomic, strong) UIImageView *headImgView;
@property (nonatomic, strong) UILabel *nickNameLabel;

- (void) setCell:(FriendItem*)friendItem ;
@end
