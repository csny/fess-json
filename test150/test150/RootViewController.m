//
//  RootViewController.m
//  test150
//
//  Created by macbook on 2015/03/08.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Alertの都合でviewDidAppearからスタート
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// AlertViewでエラーが出るのでここから処理開始
- (void)viewDidAppear:(BOOL)animated
{
    //[self urlconnect];
    [self urlsession];
}

// Alert表示
// [self showAlert:@"text"];で呼ぶ
- (void)showAlert:(NSString*)text
{
    // UIAlertControllerクラスの有無でiOS判定
    Class class = NSClassFromString(@"UIAlertController");
    if(class){
        // iOS 8の処理
        // UIAlertControllerを使ってアラートを表示
        UIAlertController *alert = nil;
        alert = [UIAlertController alertControllerWithTitle:@"Request Failed"
                                                    message:text
                                             preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"OK"
                                                  style:UIAlertActionStyleDefault
                                                handler:nil]];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        // iOS 7の処理
        // UIAlertViewを使ってアラートを表示
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Request Failed"
                                                        message:text
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        [alert show];
    }
}

// NSURLConnectionでJSON取得
-(void)urlconnect
{
    NSString *searchword = @"txt";
    // 元のURL
    NSString *orign = @"http://192.168.1.100/fess/json?query=";
    // ttp://サーバアドレス/fess/json?query=検索語となるように生成
    NSString *url = [NSString stringWithFormat:@"%@%@",orign,searchword];
    
    // Requestの条件設定、キャッシュを使い、タイムアウトは7秒
    // errorは、エラーコードや理由が入って帰ってくる。中身見た方が早い。
    NSError *error=nil;
    // HTTPステータスコード
    NSURLResponse *response=nil;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]
                                             cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:7.0];
    NSData *json = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    if (json == nil || (error)) {
        // 通信が異常終了したときの処理
        NSLog(@"request failed.");
        NSLog(@"ERROR:%@",error);
        // アラートを出して処理中断
        [self showAlert:@"Check network environment"];
        return;
    }
    // JSONをパース、パターン1 (NSArray-valueForKeyPath)
    NSArray *array = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
    // 要素数取得
    NSString *temp_cnt = [array valueForKeyPath:@"response.pageSize"];
    const int cnt = [temp_cnt intValue]; // strからint型に変換
    
    
    // JSONの配列を整理しないでそのまま表示
    //NSLog(@"json全文：%@", array);
    // エンコードが必要なとき
    //[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]
    
    
    // パターン1 (NSArray-valueForKeyPath)
    // JSONの配列からi番目のtitle,url,lastmodifiedを抽出して出力
    // 階層（入れ子）構造になっていれば"."で区切って、全階層を記述する
    // １まとまりずつ出力したいため、objectAtIndex:iというのを入れている
    
    for (int i=0;i<cnt;i++){
        NSLog(@"ファイル名：%@", [[array valueForKeyPath:@"response.result.title"] objectAtIndex:i]);
    }
    
    // 定数cntの取得状況チェック
    NSLog(@"定数cnt:%d",cnt);
    NSLog(@"connection end");
}

// NSURLSessionでJSON取得
-(void)urlsession
{
    // 参考URL
    // http://dev.classmethod.jp/references/ios7-nsurlsession-2/
    // NSURLSession の作成
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.10/fess/json?query=txt"];
    // Requestの条件設定、キャッシュを使い、タイムアウトは7秒
    NSURLRequest *request = [NSURLRequest requestWithURL:url
                                             cachePolicy:NSURLRequestUseProtocolCachePolicy
                                         timeoutInterval:7.0];
    
    // NSURLSessionDownloadTask の作成
    NSURLSessionTask *task = [session dataTaskWithRequest:request
                                        completionHandler:^(NSData *json, NSURLResponse *response, NSError *error) {
                                            if (json==nil || (error)) {
                                                // 通信が異常終了したときの処理
                                                NSLog(@"request failed.");
                                                NSLog(@"ERROR:%@",error);
                                                // アラートを出して処理中断
                                                [self showAlert:@"Check network environment"];
                                                return;
                                            }
                                            // 通信が正に常終了したときの処理
                                            // JSONをパース、パターン1 (NSArray-valueForKeyPath)
                                            NSArray *array = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
                                            // 要素数取得
                                            NSString *temp_cnt = [array valueForKeyPath:@"response.pageSize"];
                                            const int cnt = [temp_cnt intValue]; // strからint型に変換
                                            
                                            
                                            // JSONの配列を整理しないでそのまま表示
                                            //NSLog(@"json全文：%@", array);
                                            // エンコードが必要なとき
                                            //[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]
                                            
                                            
                                            // パターン1 (NSArray-valueForKeyPath)
                                            // JSONの配列からi番目のtitle,url,lastmodifiedを抽出して出力
                                            // 階層（入れ子）構造になっていれば"."で区切って、全階層を記述する
                                            // １まとまりずつ出力したいため、objectAtIndex:iというのを入れている
                                            
                                            for (int i=0;i<cnt;i++){
                                                NSLog(@"ファイル名：%@", [[array valueForKeyPath:@"response.result.title"] objectAtIndex:i]);
                                            }
                                            
                                            // 定数cntの取得状況チェック
                                            NSLog(@"定数cnt:%d",cnt);
                                        }];
    
    
    // 通信resume開始
    [task resume];
    NSLog(@"TaskResume called");
}

@end
