//
//  LoginNetManager.h
//  BaseProject
//
//  Created by jame on 16/4/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"

@interface LoginNetManager : BaseNetManager
+(id)getUserWithUserName:(NSString *)username Pwd:(NSString *)pwd completionHandle:(void (^)(id, NSError *))completionHandle;
@end
