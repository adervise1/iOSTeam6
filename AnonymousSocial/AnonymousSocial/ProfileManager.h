//
//  ProfileManager.h
//  AnonymousSocial
//
//  Created by Dabu on 2016. 12. 6..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ProfileViewController.h"
#import "MyCommentViewController.h"

@interface ProfileManager : NSObject

@property (weak) ProfileViewController *profileViewController;
@property (weak) MyCommentViewController *commentViewController;

+ (instancetype)sharedManager;
- (void)requestMyPostListData;
- (void)completeMyPostListData:(void(^)(ProfileViewController *profileVC, MyCommentViewController *commentVC))completion;

@end
