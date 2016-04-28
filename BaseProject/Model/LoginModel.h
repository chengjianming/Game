//
//  LoginModel.h
//  BaseProject
//
//  Created by jame on 16/4/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface LoginUserModel : BaseModel

@property (nonatomic, strong)NSNumber* loginId;
@property (nonatomic, strong)NSString* createBy;
@property (nonatomic, strong)NSString* createDate;
@property (nonatomic, strong)NSString* regionId;
@property (nonatomic, strong)NSString* userId;
@property (nonatomic, strong)NSString* userName;
@property (nonatomic, strong)NSString* userStatus;
@property (nonatomic, strong)NSString* phonenum;
@property (nonatomic, strong)NSString* userRoleId;
@property (nonatomic, strong)NSString* passwd;
@property (nonatomic, strong)NSString* email;
@end



@interface LoginModel : BaseModel
@property (nonatomic, strong)NSString* msg;
@property (nonatomic, strong)NSNumber* succ;
@property (nonatomic, strong)LoginUserModel* user;

@end
