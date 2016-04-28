//
//  LoginNetManager.m
//  BaseProject
//
//  Created by jame on 16/4/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LoginNetManager.h"
#import "GameRequestPath.h"
#import "LoginModel.h"
//1. 用户登录接口:
//请求接口(POST)
//http://120.27.141.125:8080/Asset-webapp/userlogin.do?userId=注册账户@&password=密码

@implementation LoginNetManager
+(id)getUserWithUserName:(NSString *)username Pwd:(NSString *)pwd completionHandle:(void (^)(id, NSError *))completionHandle{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:username forKey:@"userId"];
    [params setObject:pwd forKey:@"password"];
    NSString *path = [LoginNetManager percentPathWithPath:kUserLoginPath params:params];
    return [LoginNetManager POST:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([LoginModel objectWithKeyValues:responseObj],error);
    }];
    
}
@end
