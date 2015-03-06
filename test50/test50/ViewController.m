//
//  ViewController.m
//  test50
//
//  Created by macbook on 2015/03/06.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // viewが読み込まれたら、テキストフィールドにservernameを表示
    appDelegate = [[UIApplication sharedApplication] delegate];
    _addressField.text = [NSString stringWithFormat:@"%@", appDelegate.servername];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// show segue移動時は毎回viewDidLoadが読み込まれるので、viewDidLoadへ移動
/*
- (void)viewDidAppear:(BOOL)animated
{
}
*/

// ボタンが押されたらsevernameをテキストフィールドの文字で上書き
- (IBAction)saveBtn:(id)sender {
    appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.servername = [NSString stringWithFormat:@"%@", _addressField.text];
}

// キーボード閉じる動作まとめ
// テキストフィールドのReturn押下でキーボードを閉じる
- (IBAction)didEnd:(id)sender {
    //[self.view endEditing:YES];
}
// キーボード外のシングルタップで閉じる
- (IBAction)didSingleTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    NSLog(@"VC tapped");
}

@end
