//
//  CheckViewModel.h
//  BaseProject
//
//  Created by jame on 16/4/29.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "CheckNetManager.h"
@interface CheckViewModel : BaseViewModel
@property (strong,nonatomic) CheckModel  *model;
-(void)getDataWithUserId:(NSString *)userId FromNetCompleteHandle:(CompletionHandle)completionHandle;
@end
