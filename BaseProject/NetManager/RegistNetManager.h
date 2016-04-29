//
//  RegistNetManager.h
//  BaseProject
//
//  Created by jame on 16/4/28.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "RegistModel.h"
@interface RegistNetManager : BaseNetManager
//http://120.27.141.125:8080/Asset-webapp/userRegist.do?userId=QAQAQqqq&userName=QWQWQW&password=123456&phoneNum=18868196382&regionId=1&userRoleId=1
+(id)getRegistUserWithUserName:(NSString *)username Pwd:(NSString *)pwd UserId:(NSString *)userId PhoneNumber:(NSString *) phoneNumber completionHandle:(void (^)(id, NSError *))completionHandle;
@end
