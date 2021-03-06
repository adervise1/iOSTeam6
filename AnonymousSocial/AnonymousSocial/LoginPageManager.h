//
//  LoginPageManager.h
//  AnonymousSocial
//
//  Created by Dabu on 2016. 12. 1..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "LoginPageViewController.h"
#import "HomeViewController.h"

@interface LoginPageManager : NSObject

@property UINavigationController *loginNavigationVC;
@property UITabBarController *homeViewController;
@property UINavigationController *profileNavigationVC;

+ (instancetype)sharedLoginManager;

// 회원가입 프로세스
- (void)userSignUp:(NSString *)email password:(NSString *)userPW rePassword:(NSString *)rePW birthDay:(NSString *)birthDay gender:(NSString *)gender;

- (void)userLogin:(NSString *)email password:(NSString *)password;
- (void)userLogout:(NSString *)token;

- (void)completeLogin:(NSString *)token;
- (void)completeUserLogout:(NSString *)token;


@end
