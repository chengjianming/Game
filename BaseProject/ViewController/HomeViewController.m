
//
//  HomeViewController.m
//  BaseProject
//
//  Created by jame on 16/4/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginTableViewController.h"
#import "UserTableViewController.h"
#import "PayViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    //修改字体颜色及字体大小
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:17]};
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(100, 100, 100, 50)];
    [btn setTitle:@"注册" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn bk_addEventHandler:^(id sender) {
        LoginTableViewController *ltvc = [[LoginTableViewController alloc]init];
        [self.navigationController pushViewController:ltvc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setFrame:CGRectMake(100, 200, 100, 50)];
    [btn1 setTitle:@"个人" forState:UIControlStateNormal];
    [btn1 setBackgroundColor:[UIColor greenColor]];
    [btn1 bk_addEventHandler:^(id sender) {
        UserTableViewController *uvc = [[UserTableViewController alloc]init];
        [self.navigationController pushViewController:uvc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setFrame:CGRectMake(100, 300, 100, 50)];
    [btn2 setTitle:@"支付" forState:UIControlStateNormal];
    [btn2 setBackgroundColor:[UIColor redColor]];
    [btn2 bk_addEventHandler:^(id sender) {
        PayViewController *pvc = [[PayViewController alloc]init];
        [self.navigationController pushViewController:pvc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // Do any additional setup after loading the view.
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

@end
