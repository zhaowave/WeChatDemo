//
//  MeTableViewCell.m
//  WeChatDemo
//
//  Created by wei zhao on 2016/11/17.
//  Copyright © 2016年 wei zhao. All rights reserved.
//

#import "MeTableViewCell.h"

@implementation MeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        if (!_headImgView) {
            _headImgView = [[UIImageView alloc]
                            initWithFrame:CGRectMake(12, 12, 66,66)];
            _headImgView.clipsToBounds = YES;
            //圆角
            _headImgView.layer.cornerRadius = 3;
            
            [self.contentView addSubview:_headImgView];
        }
        
        if (!_nickNameLabel) {
            _nickNameLabel = [[UILabel alloc]
                              initWithFrame:CGRectMake(90, 19,
                                                       160, 30)];
            
            _nickNameLabel.font = [UIFont systemFontOfSize:20];
            
            [self.contentView addSubview:_nickNameLabel];
        }
        
        if (!_weChatLabel) {
            _weChatLabel = [[UILabel alloc]
                            initWithFrame:CGRectMake(90,
                                                     _nickNameLabel.frame.origin.y +
                                                     _nickNameLabel.frame.size.height,
                                                     160, 35)];
            
            _weChatLabel.font = [UIFont systemFontOfSize:15];
            [self.contentView addSubview:_weChatLabel];
        }
        if (!_qrCodeView) {
            _qrCodeView = [[UIImageView alloc]
                           initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 70,
                                                    30,
                                                    30, 30)];
            
            [self.contentView addSubview:_qrCodeView];
        }
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setModel:(PersonInfoModel *)model {
    self.headImgView.image = [UIImage imageNamed:model.headImageName];
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:model.nickName];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, str.length)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(0, str.length)];
    self.nickNameLabel.attributedText = str;
    
    self.weChatLabel.text = model.weChatId;
    
    self.qrCodeView.image = [UIImage imageNamed:@"ScanQRCode"];
    self.qrCodeView.backgroundColor = [UIColor whiteColor];
}
@end
