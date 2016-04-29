//
//  LoginViewModel.m
//  BaseProject
//
//  Created by jame on 16/4/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel
-(LoginModel *)model{
    if (!_model) {
        _model = [LoginModel new];
    }
    return _model;
}

-(void)getDataWithUserName:(NSString *)userName Pwd:(NSString *)pwd FromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [LoginNetManager getUserWithUserName:userName Pwd:pwd completionHandle:^(LoginModel *model, NSError *error) {
        self.model = model;
//        NSLog(@"userData:%@",self.model.user);
        completionHandle(error);
    }];
}
-(LoginUserModel *)user{
    
    return self.model.user;
}
-(NSString *)email{
    return self.model.user.email;
}
@end
