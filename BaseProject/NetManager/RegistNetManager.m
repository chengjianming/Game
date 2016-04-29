//
//  RegistNetManager.m
//  BaseProject
//
//  Created by jame on 16/4/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RegistNetManager.h"

//http://120.27.141.125:8080/Asset-webapp/userRegist.do?userId=QAQAQqqq&userName=QWQWQW&password=123456&phoneNum=18868196382&regionId=1&userRoleId=1
@implementation RegistNetManager
+(id)getRegistUserWithUserName:(NSString *)username Pwd:(NSString *)pwd UserId:(NSString *)userId PhoneNumber:(NSString *)phoneNumber completionHandle:(void (^)(id, NSError *))completionHandle{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:username forKey:@"userName"];
    [params setObject:pwd forKey:@"password"];
    [params setObject:phoneNumber forKey:@"phoneNum"];
    [params setObject:@"1" forKey:@"regionId"];
    [params setObject:@"1" forKey:@"userRoleId"];
    [params setObject:userId forKey:@"userId"];
    NSString *path = [self percentPathWithPath:kUserRegistPath params:params];
    return [self POST:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([RegistModel objectWithKeyValues:responseObj],error);
    }];
}
@end
