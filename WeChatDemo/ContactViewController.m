//
//  ContactViewController.m
//  WeChatDemo
//
//  Created by wei zhao on 2016/11/15.
//  Copyright © 2016年 wei zhao. All rights reserved.
//

#import "ContactViewController.h"
#import "ContactTableViewCell.h"

@interface ContactViewController ()

@end

@implementation ContactViewController
{
    NSArray *_array;
    NSArray *_arrayImg;
}

- (void)viewDidLoad {
    self.title = @"通讯录";
    [super viewDidLoad];
    _array = @[@"新的朋友",@"群聊",@"标签",@"公众号"];
    _arrayImg = @[@"plugins_FriendNotify",@"add_friend_icon_addgroup",@"Contact_icon_ContactTag",@"add_friend_icon_offical"];
    /*
        构造通讯录显示的数据
     */
    _dataDict = [[NSMutableDictionary alloc] init];
    FriendItem *item1 = [[FriendItem alloc] init];
    item1.headImgName = @"siegrain_avatar";
    item1.nickName = @"吧福记绿豆酥";
    item1.namePinYin = @"b";
    FriendItem *item2 = [[FriendItem alloc] init];
    item2.headImgName = @"siegrain_avatar";
    item2.nickName = @"啊福记绿豆酥";
    item2.namePinYin = @"a";
    FriendItem *item3 = [[FriendItem alloc] init];
    item3.headImgName = @"siegrain_avatar";
    item3.nickName = @"才福记绿豆酥";
    item3.namePinYin = @"c";
    
    
    _indexArray = @[@"a",@"b",@"c"];
    
    
    [_dataDict setObject:@[item2] forKey:_indexArray[0]];
    [_dataDict setObject:@[item1] forKey:_indexArray[1]];
    [_dataDict setObject:@[item3] forKey:_indexArray[2]];
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 44) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [self tableFooterView];
    [self.view addSubview:_tableView];
    // Do any additional setup after loading the view.
}

- (UIView*)tableFooterView
{
    UIView* view = [[UIView alloc]
                    initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 50)];
    UILabel* label = [[UILabel alloc] initWithFrame:view.bounds];
    label.text = [NSString
                  stringWithFormat:@"20位联系人 "];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor lightGrayColor];
    [view addSubview:label];
    
    return view;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return _array.count;
    }
    NSArray *tmpArray = _dataDict[ _indexArray[section - 1] ];
    return tmpArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _indexArray.count + 1;
}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {

        ContactTableViewCell *cell = [[ContactTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        FriendItem *item = [[FriendItem alloc] init];
        item.headImgName = _arrayImg[indexPath.row];
        item.nickName = _array[indexPath.row];
        [cell setCell:item];
        cell.accessoryType = UITableViewCellAccessoryNone;
        return cell;
    }
    static NSString *cellIdentifier = @"cellID";
    ContactTableViewCell *contactCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!contactCell) {
        contactCell = [[ContactTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        NSArray *tmpArray = _dataDict[_indexArray[indexPath.section - 1]];
        FriendItem *item = tmpArray[indexPath.row];
        [contactCell setCell:item];
    }
        
    return contactCell;
    
}

- (UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0)
        return nil;
    
    UIView* headerView = [[UIView alloc]
                          initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 20)];
    headerView.backgroundColor = [UIColor colorWithWhite:.95 alpha:1];
    
    UILabel* headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    headerLabel.textColor = [UIColor lightGrayColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:14];
    headerLabel.text = self.indexArray[section - 1];
    headerLabel.frame = CGRectMake(10, 0, headerView.bounds.size.width,
                                   headerView.bounds.size.height);
    
    [headerView addSubview:headerLabel];
    return headerView;
}
- (CGFloat)tableView:(UITableView*)tableView
heightForHeaderInSection:(NSInteger)section
{
    return section == 0 ? 0 : 20;
}
- (NSArray<NSString*>*)sectionIndexTitlesForTableView:(UITableView*)tableView
{
    return _indexArray;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return  60;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
