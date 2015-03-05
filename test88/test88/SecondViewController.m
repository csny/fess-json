//
//  SecondViewController.m
//  test88
//
//  Created by macbook on 2015/03/05.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewDidAppear:(BOOL)animated
{
    appDelegate = [[UIApplication sharedApplication] delegate];
    _AddressField.text = [NSString stringWithFormat:@"%@", appDelegate.servername];
}
- (IBAction)DidPush:(id)sender {
    appDelegate = [[UIApplication sharedApplication] delegate];
    appDelegate.servername = [NSString stringWithFormat:@"%@", _AddressField.text];
}
@end
