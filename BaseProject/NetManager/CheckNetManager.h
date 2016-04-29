//
//  CheckNetManager.h
//  BaseProject
//
//  Created by jame on 16/4/29.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "CheckModel.h"
@interface CheckNetManager : BaseNetManager
+(id)getCheckWithUserId:(NSString *)userId completionHandle:(void (^)(id, NSError *))completionHandle;
@end
