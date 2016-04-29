//
//  CheckViewModel.m
//  BaseProject
//
//  Created by jame on 16/4/29.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "CheckViewModel.h"

@implementation CheckViewModel
-(CheckModel *)model{
    if (!_model) {
        _model = [CheckModel new];
    }
    return _model;
}
-(void)getDataWithUserId:(NSString *)userId FromNetCompleteHandle:(CompletionHandle)completionHandle{
    self.dataTask = [CheckNetManager getCheckWithUserId:userId completionHandle:^(CheckModel *model, NSError *error) {
        self.model = model;
        completionHandle(error);
    }];
}
@end
