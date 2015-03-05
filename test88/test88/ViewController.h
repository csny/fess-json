//
//  ViewController.h
//  test88
//
//  Created by macbook on 2015/03/05.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController
{
    AppDelegate *appDelegate;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *SearchField;

@end

