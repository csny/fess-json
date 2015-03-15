//
//  TableViewController.h
//  test100
//
//  Created by macbook on 2015/03/06.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController
// property*itemsは手入力、ストーリーボードとのひもづけなし
@property NSArray *items;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
