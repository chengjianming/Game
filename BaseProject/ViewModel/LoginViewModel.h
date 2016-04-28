//
//  LoginViewModel.h
//  BaseProject
//
//  Created by jame on 16/4/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "LoginNetManager.h"
#import "LoginModel.h"
@interface LoginViewModel : BaseViewModel

@property (strong,nonatomic) LoginModel  *model;
//- (void)getDataFromNetCompleteHandle:(CompletionHandle)
-(void)getDataWithUserName:(NSString *)userName Pwd:(NSString *)pwd FromNetCompleteHandle:(CompletionHandle)completionHandle;
@end
