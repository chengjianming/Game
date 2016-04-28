//
//  LoginModel.m
//  BaseProject
//
//  Created by jame on 16/4/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "LoginModel.h"

@implementation LoginModel
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"loginId":@"id"};
}
@end
