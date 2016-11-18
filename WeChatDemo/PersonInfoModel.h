//
//  PersonInfoModel.h
//  WeChatDemo
//
//  Created by wei zhao on 2016/11/17.
//  Copyright © 2016年 wei zhao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonInfoModel : NSObject
//头像文件名
@property (nonatomic,strong) NSString *headImageName;
//昵称
@property (nonatomic,strong) NSString *nickName;
//微信号
@property (nonatomic,strong) NSString *weChatId;

@end
