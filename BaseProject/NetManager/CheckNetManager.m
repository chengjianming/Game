//
//  CheckNetManager.m
//  BaseProject
//
//  Created by jame on 16/4/29.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "CheckNetManager.h"

@implementation CheckNetManager
+(id)getCheckWithUserId:(NSString *)userId completionHandle:(void (^)(id, NSError *))completionHandle{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setObject:userId forKey:@"user_id"];
    NSString *path = [self percentPathWithPath:kCheckPath params:params];
    return [self POST:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([CheckModel objectWithKeyValues:responseObj],error);
    }];
}

@end
