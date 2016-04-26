
//
//  HomeViewController.m
//  BaseProject
//
//  Created by jame on 16/4/25.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginTableViewController.h"
@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    //修改字体颜色及字体大小
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont boldSystemFontOfSize:17]};
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(100, 100, 50, 50)];
    [btn setTitle:@"login" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor blueColor]];
    [btn bk_addEventHandler:^(id sender) {
        LoginTableViewController *ltvc = [[LoginTableViewController alloc]init];
        [self.navigationController pushViewController:ltvc animated:YES];
    } forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
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
