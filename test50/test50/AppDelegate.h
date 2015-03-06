//
//  AppDelegate.h
//  test50
//
//  Created by macbook on 2015/03/06.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    NSString *servername;
}
// servernameをインスタンス変数として定義
@property (nonatomic, retain) NSString *servername;
@property (strong, nonatomic) UIWindow *window;


@end

