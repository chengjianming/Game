//
//  UserLoginTableViewController.m
//  BaseProject
//
//  Created by jame on 16/4/29.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "UserLoginTableViewController.h"
#import "UIView+Frame.h"
#import "LoginViewModel.h"
//系统颜色
#define kSysColor        [UIColor colorWithRed:31/255.0 green:109/255.0 blue:186/255.0 alpha:0.9]
@interface UserLoginTableViewController ()
@property (strong,nonatomic) LoginViewModel  *loginVM;
@property (strong,nonatomic) UITextField  *pwdTextFiled;
@property (strong,nonatomic) UITextField  *userTextFiled;
@end

@implementation UserLoginTableViewController

-(LoginViewModel *)loginVM{
    if (!_loginVM) {
        _loginVM = [LoginViewModel new];
    }
    return _loginVM;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    //设置左侧Navbar
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(0, 0, 15, 30);
    
    [backBtn setImage:[UIImage imageNamed:@"icon-back"] forState:UIControlStateNormal];
    [backBtn bk_addEventHandler:^(id sender) {
        [self.navigationController popViewControllerAnimated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
    self.navigationItem.leftBarButtonItem = backItem;
    [self.navigationItem setLeftBarButtonItem:backItem];
    
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

    return 7;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (indexPath.row == 3) {
        self.userTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(5, 1, cell.width-10, cell.height-2)];
        self.userTextFiled.borderStyle = UITextBorderStyleRoundedRect;
        self.userTextFiled.layer.cornerRadius = 2;
        self.userTextFiled.placeholder = @"请输入用户名";
        [cell addSubview:self.userTextFiled];
    }
    if (indexPath.row == 4) {
        self.pwdTextFiled = [[UITextField alloc]initWithFrame:CGRectMake(5, 1, cell.width-10, cell.height-2)];
        self.pwdTextFiled.borderStyle = UITextBorderStyleRoundedRect;
        self.pwdTextFiled.layer.cornerRadius = 2;
        self.pwdTextFiled.placeholder = @"请输入密码";
        [cell addSubview:self.pwdTextFiled];
    }if (indexPath.row == 5) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(0, 0, cell.width, cell.height-2)];
        [btn setTitle:@"登录" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:kSysColor];
        [btn bk_addEventHandler:^(id sender) {
            [self.loginVM getDataWithUserName:self.userTextFiled.text Pwd:self.pwdTextFiled.text FromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
//                    self.dic = [self.loginVM.model user];
//                    NSLog(@"--------user%@,%s",self.dic,__func__);
                    LoginModel *model =self.loginVM.model;
                    if (model.succ.integerValue == 1) {
                        [self showSuccessMsg:model.msg];
                    }else
                        [self showErrorMsg:model.msg];
                    [self.tableView reloadData];
                    NSLog(@"--------dataDic:%@,%s",self.loginVM.model.user,__func__);
                }
            }];
        } forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:btn];
    }
    // Configure the cell...
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
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

- (UITextField *)pwdTextFiled {
	if(_pwdTextFiled == nil) {
		_pwdTextFiled = [[UITextField alloc] init];
	}
	return _pwdTextFiled;
}

- (UITextField *)userTextFiled {
	if(_userTextFiled == nil) {
		_userTextFiled = [[UITextField alloc] init];
	}
	return _userTextFiled;
}

@end
