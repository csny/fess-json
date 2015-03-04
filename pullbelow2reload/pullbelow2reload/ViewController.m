//
//  ViewController.m
//  pullbelow2reload
//
//  Created by macbook on 2015/03/05.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self refleshControlSetting];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refleshControlSetting
{
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self
                       action:@selector(onRefresh:)
             forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
}

- (void)onRefresh:(UIRefreshControl *)refreshControl
{
    [refreshControl beginRefreshing];
    NSLog(@"更新できた"); // ここの間に更新のロジックを書く
    [refreshControl endRefreshing];
}

@end
