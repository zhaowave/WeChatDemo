//
//  ContactTableViewCell.m
//  WeChatDemo
//
//  Created by wei zhao on 2016/11/18.
//  Copyright © 2016年 wei zhao. All rights reserved.
//

#import "ContactTableViewCell.h"

@implementation ContactTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _headImgView = [[UIImageView alloc] init];
        _headImgView.frame = CGRectMake(10, 10, 40, 40);
        _nickNameLabel = [[UILabel alloc] init];
        _nickNameLabel.frame = CGRectMake(60, 10, 200, 30);
        
        [self.contentView addSubview:_headImgView];
        [self.contentView addSubview:_nickNameLabel];
    }
    return self;
}

- (void) setCell:(FriendItem*)friendItem {
    _headImgView.image = [UIImage imageNamed:friendItem.headImgName];
    _nickNameLabel.text = friendItem.nickName;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
