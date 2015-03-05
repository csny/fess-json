//
//  SecondViewController.h
//  test88
//
//  Created by macbook on 2015/03/05.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface SecondViewController : UIViewController
{
    AppDelegate *appDelegate;
}
@property (weak, nonatomic) IBOutlet UITextField *AddressField;
- (IBAction)DidPush:(id)sender;

@end
