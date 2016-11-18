//
//  MeTableViewCell.h
//  WeChatDemo
//
//  Created by wei zhao on 2016/11/17.
//  Copyright © 2016年 wei zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonInfoModel.h"

@interface MeTableViewCell : UITableViewCell
@property (nonatomic,strong) PersonInfoModel *model;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *nickNameLabel;

@property (nonatomic,strong) UILabel *weChatLabel;

@property (nonatomic,strong) UIImageView *qrCodeView;

- (void) setModel:(PersonInfoModel *)model;

@end
