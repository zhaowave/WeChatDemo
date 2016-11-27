//
//  ContactViewController.m
//  WeChatDemo
//
//  Created by wei zhao on 2016/11/15.
//  Copyright © 2016年 wei zhao. All rights reserved.
//

#import "ContactViewController.h"
#import "ContactTableViewCell.h"
#import "AFNetworking.h"
#import "PinYin4Objc.h"

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
    [self databaseOperation];
    NSString *name = @"赵伟";
    HanyuPinyinOutputFormat *outFormat = [[HanyuPinyinOutputFormat alloc] init];
    [outFormat setToneType:ToneTypeWithoutTone];
    [outFormat setVCharType:VCharTypeWithV];
    [outFormat setCaseType:CaseTypeLowercase];
    NSString *pinyin = [PinyinHelper toHanyuPinyinStringWithNSString:name withHanyuPinyinOutputFormat:outFormat withNSString:@""];
    if (pinyin) {
        NSString *nameHeadChar = [NSString stringWithFormat:@"%c",[pinyin characterAtIndex:0]];
        NSLog(@"%@",nameHeadChar);

    }
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURL *URL = [NSURL URLWithString:@"http://httpbin.org/get"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error :%@",error);
        } else {
            NSLog(@"%@ ------%@",response,responseObject);
            //NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
            
            NSString *ip = responseObject[@"origin"];
            NSLog(@"%@",ip);
        }
    }];
    [dataTask resume];
}

- (void) databaseOperation {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [[paths firstObject] copy];
    NSString *dbPath = [docDir stringByAppendingString:@"dss.db"];
    FMDatabase *db = [FMDatabase databaseWithPath:dbPath];
    if (![db open]) {
        return;
    }
    NSLog(@"ddatabase path : %@",dbPath);
//    NSString *personSql = @"CREATE TABLE 'person' ('id' INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL ,'person_id' VARCHAR(255),'person_name' VARCHAR(255),'person_age' VARCHAR(255),'person_number'VARCHAR(255)) ";
//    NSString *carSql = @"CREATE TABLE 'car' ('id' INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL ,'own_id' VARCHAR(255),'car_id' VARCHAR(255),'car_brand' VARCHAR(255),'car_price'VARCHAR(255)) ";
//    NSString *inserSql = @"insert into person (person_id,person_name,person_age,person_number) values (?,?,?,?)";
    
    NSString *isExistTable = @"SELECT COUNT(*) FROM sqlite_sequence where name='contact_friend'";
    FMResultSet *ret = [db executeQuery:isExistTable];
    int count = 0;
    if (ret.next) {
        count = [ret intForColumnIndex:0];
    }
    
    
    NSString *friendSql = @"CREATE TABLE 'contact_friend' ('id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'nick_name' VARCHAR(255),'remark_name' VARCHAR(255),'im_userid' VARCHAR(255))";
    
    NSString *customerSql = @"CREATE TABLE 'contact_customer' ('id' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,'real_name' VARCHAR(255),'phone_num' VARCHAR(255),'im_userid' VARCHAR(255))";
    NSString *insertFriendSql = @"insert into 'contact_friend' ('nick_name','remark_name','im_userid') values (?,?,?)";
    
    NSString *insertCustomerdSql = @"insert into 'contact_customer' ('real_name','phone_num','im_userid') values (?,?,?)";
    
    if (count == 0) {
        [db executeUpdate:friendSql];
        [db executeUpdate:customerSql];
    }
    
    //[db executeUpdate:insertFriendSql,@"AAA",@"AAA1",@"0000001"];
    //[db executeUpdate:insertCustomerdSql,@"东北人",@"13300010001",@"0000001"];
    
    NSTimeInterval beginTime = [[NSDate date] timeIntervalSince1970]*1000;
    
    
    NSString *querySQL =  @"select f.nick_name,c.real_name from contact_friend as f ,contact_customer as c where f.im_userid=c.phone_num";
    FMResultSet *queryResult = [db executeQuery:querySQL];
    while (queryResult.next) {
        NSString *realName = [queryResult stringForColumnIndex:1];
    }
    NSTimeInterval endTime = [[NSDate date] timeIntervalSince1970]*1000;
    long timeSpace = endTime-beginTime;
    
   // [db executeUpdate:inserSql,@"personid1",@"personname1",@"18",@"number1"];

    [db close];
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
