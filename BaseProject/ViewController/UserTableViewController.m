//
//  UserTableViewController.m
//  BaseProject
//
//  Created by jame on 16/4/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "UserTableViewController.h"
#import "UIView+Frame.h"
@interface UserTableViewController ()

@end

@implementation UserTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
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
#warning Incomplete implementation, return the number of sections
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
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
    if (indexPath.section == 0) {
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
        }else{
            cell.textLabel.text = @"消费记录";
        }
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        if (indexPath.row == 0) {
            cell.textLabel.text = @"修改密码";
        }else{
            cell.textLabel.text = @"账号安全";
        }
    }
    // Configure the cell...
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0 ) {
        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, 30)];
        NSString *Name = @"123";
        UILabel *userLb = [[UILabel alloc]initWithFrame:CGRectMake(5, 10, self.view.width-100, 40)];
        userLb.backgroundColor = [UIColor greenColor];
        userLb.text = [NSString stringWithFormat:@"当前账户: %@",Name];
        UIButton *loutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [loutBtn setFrame:CGRectMake(self.view.width-50, 10, 50, 40)];
        [loutBtn setImage:[UIImage imageNamed:@"UMS_nav_button_close"] forState:UIControlStateNormal];
        [loutBtn setBackgroundColor:[UIColor grayColor]];
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
