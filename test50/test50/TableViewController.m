//
//  TableViewController.m
//  test50
//
//  Created by macbook on 2015/03/06.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 更新機能の呼び出し
    [self refleshControlSetting];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// viewが読み込まれたら
// TableViewControllerのviewDidLoadは起動時のみ、viewDidAppearはBackボタンでも毎回読み込まれる
- (void)viewDidAppear:(BOOL)animated
{
    appDelegate = [[UIApplication sharedApplication] delegate];
}

// 下に引っ張ると更新する機能の準備
- (void)refleshControlSetting
{
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self
                       action:@selector(onRefresh:)
             forControlEvents:UIControlEventValueChanged];
    [self.tableView addSubview:refreshControl];
}

// 更新時に実行
- (void)onRefresh:(UIRefreshControl *)refreshControl
{
    [refreshControl beginRefreshing];
    // ここの間に更新のロジックを書く
    NSLog(@"http://%@/fess/json?query=%@", appDelegate.servername, _searchField.text);
    [refreshControl endRefreshing];
}

// キーボード閉じる動作まとめ
// テキストフィールドのReturn押下でキーボードを閉じる
- (IBAction)didEnd:(id)sender {
    //[self.view endEditing:YES];
}
// キーボード外のシングルタップで閉じる
- (IBAction)didSingleTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    NSLog(@"TV tapped");
}

@end
