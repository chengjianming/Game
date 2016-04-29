//
//  RegistViewModel.m
//  BaseProject
//
//  Created by jame on 16/4/29.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "RegistViewModel.h"

@implementation RegistViewModel
-(void)getDataWithUserName:(NSString *)userName Pwd:(NSString *)pwd UserId:(NSString *)userId PhoneNumber:(NSString *)phoneNumber FromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [RegistNetManager getRegistUserWithUserName:userName Pwd:pwd UserId:userId PhoneNumber:phoneNumber completionHandle:^(RegistModel *model, NSError *error) {
        self.model = model;
        NSLog(@"dataDic:%@",self.model);
        completionHandle(error);
    }];
}
@end
