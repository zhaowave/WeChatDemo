//
//  MeViewController.m
//  WeChatDemo
//
//  Created by wei zhao on 2016/11/15.
//  Copyright © 2016年 wei zhao. All rights reserved.
//

#import "MeViewController.h"
#import "PersonInfoModel.h"
#import "MeTableViewCell.h"

@interface MeViewController ()

@end

@implementation MeViewController

- (void)viewDidLoad {
    self.title = @"我";
    [super viewDidLoad];
    [self initializeData];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-44) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorInset = UIEdgeInsetsZero;
    [self.view addSubview:_tableView];
    
    //self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
}

- (void) initializeData {
    PersonInfoModel *personInfoModel = [[PersonInfoModel alloc] init];
    personInfoModel.headImageName = @"siegrain_avatar";
    personInfoModel.nickName = @"zhaowei";
    personInfoModel.weChatId = @"微信号：piandaoshu";
    _dataArray = @[
                   @[personInfoModel],
                   @[@"相册", @"收藏", @"钱包", @"卡包"],
                   @[@"表情"],
                   @[@"设置"]
    ];
    _imageArray = @[
                    @[ @"" ],
                    @[
                        @"MoreMyAlbum",
                        @"MoreMyFavorites",
                        @"MoreMyBankCard",
                        @"MyCardPackageIcon"
                    ],
                    @[ @"MoreExpressionShops" ],
                    @[ @"MoreSetting" ]
                    
                    ];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *arr = _dataArray[section];
    return arr.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        MeTableViewCell *meCell = [[MeTableViewCell alloc] init];
        [meCell setModel:_dataArray[indexPath.section][indexPath.row]];
        meCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return meCell;
    }
    static NSString *cellIdentifier = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    cell.imageView.image = [UIImage imageNamed:_imageArray[indexPath.section][indexPath.row]];
    cell.textLabel.text = _dataArray[indexPath.section][indexPath.row];

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataArray.count;
}


- (CGFloat)tableView:(UITableView*)tableView
heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    if (indexPath.section == 0)
        return 90;
    
    return 44;
}

//设置头视图高度
- (CGFloat)tableView:(UITableView*)tableView
heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
        return 15;
    
    return 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
