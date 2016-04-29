//
//  PayViewController.m
//  BaseProject
//
//  Created by jame on 16/4/26.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "PayViewController.h"
#import "UIView+Frame.h"
#import "NSObject+Common.h"

//系统颜色
#define kSysColor        [UIColor colorWithRed:31/255.0 green:109/255.0 blue:186/255.0 alpha:0.9]
@interface PayViewController ()
@property (strong,nonatomic) UIView  *rightView;
@property (nonatomic,assign) NSInteger result;
@property (strong,nonatomic) NSMutableArray  *userArr;
@end

@implementation PayViewController

-(CheckViewModel *)checkVM{
    if (!_checkVM) {
        _checkVM = [CheckViewModel new];
    }
    return _checkVM;
}

-(NSArray *)userArr{
    if (!_userArr) {
        _userArr = [NSMutableArray new];
    }
    return _userArr;
}

-(UIView *)rightView{
    if (!_rightView) {
        _rightView = [[UIView alloc]init];
    }
    return _rightView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"订单确认";
    //支付订单返回结果
    self.result = 1;
    [self.view setBackgroundColor:[UIColor whiteColor]];
    //设置左侧支付方式选择
    [self setLeftView];
    
    //设置左侧Navbar
    [self setBack];
    //订单详情
   [self.checkVM getDataWithUserId:@"123456" FromNetCompleteHandle:^(NSError *error) {
       if (error) {
           [self showErrorMsg:error.localizedDescription];
       }
       CheckModel *model = self.checkVM.model;
       NSLog(@"CheckModel:%@",model);
       if (model.succ.integerValue == 1) {
           [self showSuccessMsg:model.msg];
           NSString *yuanbao = [NSString stringWithFormat:@"%ld元宝",model.Pay_money.integerValue*100/10+model.Pay_money.integerValue*100%10];
           NSString *yuan = [model.Pay_money stringByAppendingString:@"元"];
           [self.userArr setArray: @[yuan,model.Game_num,yuanbao,@"123456",@""]];
           NSLog(@"userArr:%@",self.userArr);
           //设置右侧显示详情
           
           [self setRightView];
           
       }else{
           [self showErrorMsg:model.msg];
       }
//       [self.view setNeedsDisplay];
   }];
    
    
    // Do any additional setup after loading the view.
}
- (void)setLeftView{
    UIView *leftMenuView = [[UIView alloc]initWithFrame:CGRectMake(0, 64+5, self.view.width/3, self.view.height-64-5)];
    leftMenuView.backgroundColor = kSysColor;
    //设置三个支付方式
    NSArray *arr = @[@"支付宝",@"微信",@"平台币"];
    CGFloat btnWidth = leftMenuView.width-20;
    CGFloat btnHeight = btnWidth*190/235;
    for (int i =0; i<arr.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setFrame:CGRectMake(10, 15*(i+1)+btnHeight*i, btnWidth, btnHeight)];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        [btn setTitleColor:kSysColor forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor whiteColor]];
        btn.layer.cornerRadius = 10;
        [leftMenuView addSubview:btn];
    }
    [self.view addSubview:leftMenuView];
}

-(void)setRightView{
    CGFloat rightX = self.view.width/3;
    CGFloat rightY = 64+5;
    CGFloat rightWidth = self.view.width/3*2;
    CGFloat rightHeight = self.view.height-64-5;
    self.rightView.frame = CGRectMake(rightX, rightY, rightWidth, rightHeight);
//    self.rightView.backgroundColor = [UIColor yellowColor];
    //设置实线
    [self setLine];
    
    //设置虚线
    [self setVirtualLine];
    //设置充值按钮
    [self setPay];
    
    if (self.result) {
        //设置订单详情
        [self setOrder];
        
    }else{
        [self setNoOrder];
    }
    [self.view addSubview:self.rightView];
}

-(void)setLine{
//    CGFloat lineWidth = self.rightView.width;
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.width/3*2, 2)];
    lineView.backgroundColor = kSysColor;
    [self.rightView addSubview:lineView];
}

-(void)setNoOrder{
    CGFloat labelX = 30;
    CGFloat labelY = 10;
    CGFloat labelWidth = self.rightView.width - 30;
    CGFloat labelHeight = 20;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(labelX, labelY, labelWidth, labelHeight)];
    label.text = @"没有未支付订单";
    [self.rightView addSubview:label];
}

-(void)setOrder{
    NSArray *orderArr = @[@"支付金额: ",@"游戏名称: ",@"商品名称: ",@"购买账号:",@"请确认订单再进行充值"];
    //接口解析后将传入的数据放进这个数组
//    NSArray *userArr = @[@"98.0元",@"东方不败",@"980元宝",@"baobao123",@""];
    NSArray *userArr = self.userArr;
    CGFloat labelX = 30;
    CGFloat labelY = 10;
    CGFloat labelWidth = self.rightView.width - 30;
    CGFloat labelHeight = 20;
    if (userArr.count == 5) {
        for (int i = 0; i < orderArr.count; i++) {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(labelX, labelY*(i+1)+labelHeight*i, labelWidth, labelHeight)];
            label.text = [[orderArr[i] stringByAppendingString:@" "]stringByAppendingString:userArr[i]];
            if (i == 0) {
                
            }
            if (i == 4) {
                label.textColor = kSysColor;
            }
            [self.rightView addSubview:label];
        }
    }
}

-(void)setPay{
    UIButton *payBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    CGFloat payX = 30;
    CGFloat payY = 10*6+20*5+10+20;
    CGFloat payWidth = self.rightView.width -30*2;
    CGFloat payHeight = 50;
    [payBtn setFrame:CGRectMake(payX, payY, payWidth, payHeight)];
    payBtn.layer.cornerRadius = 10;
    [payBtn setTitle:@"立即充值" forState:UIControlStateNormal];
    [payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [payBtn setBackgroundColor:kSysColor];
    [payBtn bk_addEventHandler:^(id sender) {
        NSLog(@"点击支付");
    } forControlEvents:UIControlEventTouchUpInside];
    [self.rightView addSubview:payBtn];
    
}

- (void)setVirtualLine{
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 10*6+20*5+10, self.rightView.width, 2)];
    UIImageView *vline = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon-virtualline"]];
    vline.frame = CGRectMake(0, 0, lineView.width, lineView.height);
    [lineView addSubview:vline];
    [self.rightView addSubview:lineView];
}

-(void)setBack{
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
