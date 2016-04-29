//
//  RegistViewModel.h
//  BaseProject
//
//  Created by jame on 16/4/29.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "RegistNetManager.h"
@interface RegistViewModel : BaseViewModel
@property (strong,nonatomic) RegistModel  *model;
-(void)getDataWithUserName:(NSString *)userName Pwd:(NSString *)pwd UserId:(NSString *)userId PhoneNumber:(NSString *)phoneNumber FromNetCompleteHandle:(CompletionHandle)completionHandle;
@end
