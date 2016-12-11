//
//  LoginPageManager.m
//  AnonymousSocial
//
//  Created by Dabu on 2016. 12. 1..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import "LoginPageManager.h"
#import "UserInfomation.h"
#import "CustomAlertController.h"
#import <KeychainItemWrapper.h>

@class RequestObject;

@interface LoginPageManager ()

@end

@implementation LoginPageManager


+ (instancetype)sharedLoginManager {
    
    static LoginPageManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [[LoginPageManager alloc] init];
    });
    
    return manager;
}

// RequestObject에 유저에대한 정보를담아 회원가입메소드를 호출
- (void)userSignUp:(NSDictionary *)userInfo completion:(LoginCompletion)completion {
    
    [RequestObject requestSignUp:userInfo completion:completion];
}


- (void)userLogin:(NSDictionary *)userInfo completion:(LoginCompletion)completion {
    
    [RequestObject requestLogin:userInfo completion:completion];
}

- (void)userLogout:(NSString *)token completion:(NetworkCompletion)completion {
    
    [RequestObject requestLogout:token completion:completion];
}

#pragma mark - Complete Method

- (void)completeLogin:(NSString *)token {
    
    /*
     RequestObject에서 토큰을 받아와서
     UserInfomagion 싱글톤객체에 유저정보를 업데이트
     LoginNavigation 을 해제
     
     오토로그인을 체크하였다면 키체인에 토큰을 등록!!
     */
    [[UserInfomation sharedUserInfomation] settingUserToken:token];
    [UserInfomation sharedUserInfomation].userLogin = YES;
    
    // 오토로그인설정
    if ([UserInfomation sharedUserInfomation].autoLogin) {
        KeychainItemWrapper *keyChain = [[KeychainItemWrapper alloc] initWithIdentifier:@"AnonymousSocial" accessGroup:nil];
        [keyChain setObject:token forKey:(__bridge id)(kSecAttrAccount)];
        NSLog(@"--------keyChain token = %@", [keyChain objectForKey:(__bridge id)(kSecAttrAccount)]);
    }

    //이부분에 "로그인되었습니다" 란 얼럿창 띄우기
    [CustomAlertController showCutomAlert:self.loginNavigationVC type:CustomAlertTypeCompleteLogin completion:nil];
    
}

- (void)completeUserLogout:(NSString *)token {
    
    // 로그아웃 되었으니 유저정보를 다시세팅!!
    // 오토로그인상태였다면 키체인을 지운다!!
//    [[UserInfomation sharedUserInfomation] settingUserToken:nil];
//    [UserInfomation sharedUserInfomation].userLogin = NO;
//    [UserInfomation sharedUserInfomation].autoLogin = NO;
//    
//    KeychainItemWrapper *keyChain = [[KeychainItemWrapper alloc] initWithIdentifier:@"AnonymousSocial" accessGroup:nil];
//    [keyChain resetKeychainItem];
//    [CustomAlertController showCustomLogoutAlert:self.homeViewController navigationVC:self.profileNavigationVC];
}


@end
