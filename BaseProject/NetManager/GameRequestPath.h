//
//  GameRequestPath.h
//  BaseProject
//
//  Created by jame on 16/4/27.
//  Copyright © 2016年 Tarena. All rights reserved.
//

#ifndef GameRequestPath_h
#define GameRequestPath_h

//1. 用户登录接口:
#define kUserLoginPath      @"http://120.27.141.125:8080/Asset-webapp/userlogin.do"

//2.用户注册接口
#define kUserRegistPath     @"http://120.27.141.125:8080/Asset-webapp/userRegist.do"

//3.充值结果
#define kPayResultPath      @"http://120.27.141.125:8080/Asset-webapp/payresult.do"

//4.游戏接口添加
#define kAddGamePath        @"http://120.27.141.125:8080/Asset-webapp/addgame.do"

//5.游戏查询接口
#define kCheckGamePath      @"http://120.27.141.125:8080/Asset-webapp/checkgame.do"

//6.用户是否在线
#define kCheckUsePath       @"http://120.27.141.125:8080/Asset-webapp/checkuser.do"

//7.聚禾富支付结果保存更改接口 和 8.游戏支付结果保存和更改接口
#define kGamePayRetUrlPath  @"http://120.27.141.125:8080/Asset-webapp/gamepayreturl.do"

#endif /* GameRequestPath_h */
