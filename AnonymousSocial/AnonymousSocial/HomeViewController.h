//
//  HomeViewController.h
//  AnonymousSocial
//
//  Created by Dabu on 2016. 11. 28..
//  Copyright © 2016년 iosSchool. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITableView *mainTableView;

@property NSArray *postDataArray;

- (void)reloadData;

@end
