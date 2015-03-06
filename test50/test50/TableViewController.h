//
//  TableViewController.h
//  test50
//
//  Created by macbook on 2015/03/06.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface TableViewController : UITableViewController
{
    AppDelegate *appDelegate;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *searchField;
- (IBAction)didEnd:(id)sender;
- (IBAction)didSingleTap:(UITapGestureRecognizer *)sender;

@end
