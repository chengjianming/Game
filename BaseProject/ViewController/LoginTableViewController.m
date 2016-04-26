//
//  LoginTableViewController.m
//  BaseProject
//
//  Created by jame on 16/4/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LoginTableViewController.h"
#import "UIView+Frame.h"
//系统颜色
#define kSysColor        [UIColor colorWithRed:31/255.0 green:109/255.0 blue:186/255.0 alpha:0.9]
@interface LoginTableViewController ()
@property (strong,nonatomic) UITextField  *userTextFiled;
@property (strong,nonatomic) UITextField  *pwdTextFiled;
@property (strong,nonatomic) UIButton  *leftBtn;
@property (strong,nonatomic) UIButton  *rightBtn;
@end

@implementation LoginTableViewController


-(UIButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.selected = YES;
        [_leftBtn setTitleColor:kSysColor forState:UIControlStateSelected];
        [_leftBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    return _leftBtn;
}
-(UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.selected = NO;
        [_rightBtn setTitleColor:kSysColor forState:UIControlStateSelected];
        [_rightBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    return _rightBtn;
}
-(UITextField *)userTextFiled{
    if (!_userTextFiled) {
        _userTextFiled = [[UITextField alloc]init];
    }
    return _userTextFiled;
}
-(UITextField *)pwdTextFiled{
    if (!_pwdTextFiled) {
        _pwdTextFiled = [[UITextField alloc]init];
    }
    return _pwdTextFiled;
}

kRemoveCellSeparator;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
   //修改字体颜色及字体大小
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:17]};
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row == 0) {
        self.userTextFiled.frame = CGRectMake(10, 0, self.view.width, cell.height);
        if (self.leftBtn.selected) {
            self.userTextFiled.placeholder = @"请输入手机号码";
        }else{
            self.userTextFiled.placeholder = @"请输入账号";
        }
        [self setTextFiled:self.userTextFiled];
        [cell addSubview:self.userTextFiled];
    }
    if (indexPath.row == 1) {
        self.pwdTextFiled.frame = CGRectMake(10, 0, self.view.width, cell.height);
        self.pwdTextFiled.placeholder = @"请输入密码";
        [self setTextFiled:self.pwdTextFiled];
        [cell addSubview:self.pwdTextFiled];
    }
    // Configure the cell...
    
    return cell;
}
#pragma 设置textfiled
-(void)setTextFiled:(UITextField *)textFiled{
//    textFiled.borderStyle = UITextBorderStyleLine;
//    textFiled.layer.borderColor = [UIColor colorWithRed:196.0 green:196.0 blue:196.0 alpha:0.8].CGColor;
//    textFiled.layer.borderWidth = 1;
//    textFiled.layer.cornerRadius = 3;
//    UIImageView *textFiledImv = [[UIImageView alloc]init];
//    textFiledImv.image = [UIImage imageNamed:imageName];
//    textFiledImv.frame = CGRectMake(10, 5, textFiled.height-10, textFiled.height-10);
//    textFiledImv.contentMode = UIViewContentModeScaleAspectFit;
//    textFiled.leftView = textFiledImv;
//    textFiled.leftViewMode = UITextFieldViewModeAlways;
}
//设置tableViewHeader
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.view.height*250/1200;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height*250/1200)];
    headerView.backgroundColor = [UIColor clearColor];
    [self.leftBtn setFrame:CGRectMake(0, headerView.height-100, headerView.width/2, 100)];
    [self.leftBtn setTitle:@"手机注册" forState:UIControlStateNormal];
    
    
//    [self.leftBtn setBackgroundColor:[UIColor whiteColor]];
    
    [self.rightBtn setFrame:CGRectMake(headerView.width/2, headerView.height-100, headerView.width/2, 100)];
    [self.rightBtn setTitle:@"账户注册" forState:UIControlStateNormal];


//    [self.rightBtn setBackgroundColor:[UIColor whiteColor]];
    [self.leftBtn bk_addEventHandler:^(id sender) {
        self.leftBtn.selected = YES;
        self.rightBtn.selected = NO;
        [self.tableView reloadData];
    } forControlEvents:UIControlEventTouchUpInside];
    [self.rightBtn bk_addEventHandler:^(id sender) {
        self.leftBtn.selected = NO;
        self.rightBtn.selected = YES;
        [self.tableView reloadData];
    } forControlEvents:UIControlEventTouchUpInside];
    
    [headerView addSubview:self.leftBtn];
    [headerView addSubview:self.rightBtn];
    
    return headerView;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 300)];
    CGFloat bWidth = footerView.width-2;
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setFrame:CGRectMake(0, 50,bWidth/2 ,50 )];
    [btn1 setTitle:@"已有账号" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn1 setBackgroundColor:kSysColor];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setFrame:CGRectMake(bWidth/2+2, 50, bWidth/2, 50)];
    [btn2 setTitle:@"快速游戏" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn2 setBackgroundColor:kSysColor];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setFrame:CGRectMake(0, 50+50+2, footerView.width, 50)];
    [btn3 setTitle:@"快速注册" forState:UIControlStateNormal];
    [btn3 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn3 setBackgroundColor:kSysColor];
    
    [footerView addSubview:btn1];
    [footerView addSubview:btn2];
    [footerView addSubview:btn3];
    return footerView;
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
