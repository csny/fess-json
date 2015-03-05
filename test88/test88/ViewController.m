//
//  ViewController.m
//  test88
//
//  Created by macbook on 2015/03/05.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

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

- (void)viewDidAppear:(BOOL)animated
{
    appDelegate = [[UIApplication sharedApplication] delegate];
    //NSlog(@"%@", appDelegate.servername);
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
    NSLog(@"http://%@/fess/json?query=%@", appDelegate.servername, _SearchField.text);
    // ここの間に更新のロジックを書く
    [refreshControl endRefreshing];
}
@end
