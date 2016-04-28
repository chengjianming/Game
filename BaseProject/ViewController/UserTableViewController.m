//
//  UserTableViewController.m
//  BaseProject
//
//  Created by jame on 16/4/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "UserTableViewController.h"
#import "UIView+Frame.h"
#import "LoginViewModel.h"
@interface UserTableViewController ()
@property (strong,nonatomic) LoginViewModel  *LoginVM;
@property (strong,nonatomic) NSDictionary *dic;
@end

@implementation UserTableViewController

-(LoginViewModel *)LoginVM{
    if (!_LoginVM) {
        _LoginVM = [[LoginViewModel alloc]init];
    }
    return _LoginVM;
}
-(NSDictionary *)dic{
    if (!_dic) {
        _dic = [NSDictionary new];
    }
    return _dic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
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
    
    //获取数据
//    [self.LoginVM getDataFromNetCompleteHandle:^(NSError *error) {
//        
//    }];
    [self.LoginVM getDataWithUserName:@"asd123" Pwd:@"asd123" FromNetCompleteHandle:^(NSError *error) {
        if (error) {
            [self showErrorMsg:error.localizedDescription];
        }else{
            if (self.dic == nil) {
                [self showProgress];
            }
            self.dic = [self.LoginVM.model user];
            NSLog(@"--------user%@,%s",self.dic,__func__);
            [self.tableView reloadData];
            NSLog(@"--------dataDic:%@,%s",self.LoginVM.model.user,__func__);
            [self hideProgress];
        }
    }];
    
   
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

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 2;
    }
    else
        return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    if (indexPath.section == 0) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.imageView.image = [UIImage imageNamed:@"icon-gold"];
        cell.textLabel.text = [NSString stringWithFormat:@"乐豆余额:  1200"];
        UIButton *payBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [payBtn setTitle:@"立即充值" forState:UIControlStateNormal];
        [payBtn setFrame:CGRectMake(cell.width-100, 5, 80, cell.height-10)];
        payBtn.layer.cornerRadius = 10;
        [payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [payBtn setBackgroundColor:[UIColor orangeColor]];
//        payBtn
        [cell addSubview: payBtn];
    }else if (indexPath.section == 1){
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row == 0) {
            cell.textLabel.text = @"充值记录";
            cell.imageView.image = [UIImage imageNamed:@"icon-chjl"];
        }else{
            cell.textLabel.text = @"消费记录";
            cell.imageView.image = [UIImage imageNamed:@"icon-xfjl"];
        }
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row == 0) {
            cell.textLabel.text = @"修改密码";
            cell.imageView.image = [UIImage imageNamed:@"icon-mima"];
        }else{
            cell.textLabel.text = @"账号安全";
            cell.imageView.image = [UIImage imageNamed:@"icon-tu"];
        }
    }
    // Configure the cell...
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0 ) {
        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 30)];
        NSString *Name = [self.dic objectForKey:@"userName"];
        UILabel *userLb = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, self.view.width-100, 40)];
//        userLb.backgroundColor = [UIColor greenColor];
        userLb.text = [NSString stringWithFormat:@"当前账户: %@",Name];
        UIButton *loutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [loutBtn setFrame:CGRectMake(self.view.width-50, 10, 50, 40)];
        [loutBtn setImage:[UIImage imageNamed:@"icon-quit"] forState:UIControlStateNormal];
        [loutBtn setBackgroundColor:[UIColor clearColor]];
        [headerView addSubview:userLb];
        [headerView addSubview:loutBtn];
        return headerView;
    }else{
        return nil;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 50;
    }else if (section == 1){
        return 10;
    }else{
        return 1;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section != 0) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    
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
