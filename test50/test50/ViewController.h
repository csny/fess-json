//
//  ViewController.h
//  test50
//
//  Created by macbook on 2015/03/06.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController
{
    AppDelegate *appDelegate;
}

@property (weak, nonatomic) IBOutlet UITextField *addressField;
- (IBAction)saveBtn:(id)sender;
- (IBAction)didEnd:(id)sender;
- (IBAction)singleTapped:(id)sender;

@end
