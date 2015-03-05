//
//  main.m
//  test1
//
//  Created by macbook on 2015/02/28.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import <Foundation/Foundation.h>

// FESSサーバAPIからJSON形式でなにかを表示する。
// パターン1.NSArray-valueForKeyPath
// qiitaの以下の記事から丸パクリ
// http://qiita.com/drapon/items/859473840211f0ac1552
void getfessjson_pt1()
{
    // FESSサーバのAPI取得URLを生成
    // 検索語彙
    NSString *searchword = @"txt";
    // 元のURL
    NSString *orign = @"http://www.orenchi.local/fess/json?query=";
    // ttp://サーバアドレス/fess/json?query=検索語となるように生成
    NSString *url = [NSString stringWithFormat:@"%@%@",orign,searchword];
    
    // NSURLRequestの生成
    // NSURLからNSURLRequestを作る
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    // サーバーとの通信を行う
    NSData *json = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    
    // JSONをパース、パターン1 (NSArray-valueForKeyPath)
    NSArray *array = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
    // 要素数取得
    NSString *temp_cnt = [array valueForKeyPath:@"response.pageSize"];
    const int cnt = [temp_cnt intValue]; // strからint型に変換
    
    
    // JSONの配列を整理しないでそのまま表示
    //NSLog(@"json全文：%@", array);
    
    
    // パターン1 (NSArray-valueForKeyPath)
    // JSONの配列からi番目のtitle,url,lastmodifiedを抽出して出力
    // 階層（入れ子）構造になっていれば"."で区切って、全階層を記述する
    // １まとまりずつ出力したいため、objectAtIndex:iというのを入れている
    for (int i=0;i<cnt;i++){
        NSLog(@"ファイル名：%@　URL：%@　最終更新：%@", [[array valueForKeyPath:@"response.result.title"] objectAtIndex:i], [[array valueForKeyPath:@"response.result.url"] objectAtIndex:i], [[array valueForKeyPath:@"response.result.lastModified"] objectAtIndex:i]);
    }
    
    // 定数cntの取得状況チェック
    NSLog(@"定数cnt:%d",cnt);
}


// FESSサーバAPIからJSON形式でなにかを表示する。
// パターン2.NSDictionary-objectForKey
void getfessjson_pt2()
{
    // FESSサーバのAPI取得URLを生成
    // 検索語彙
    NSString *searchword = @"txt";
    // 元のURL
    NSString *orign = @"http://www.orenchi.local/fess/json?query=";
    // ttp://サーバアドレス/fess/json?query=検索語となるように生成
    NSString *url = [NSString stringWithFormat:@"%@%@",orign,searchword];
    
    // NSURLRequestの生成
    // NSURLからNSURLRequestを作る
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    // サーバーとの通信を行う
    NSData *json = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    
     // JSONをパース、パターン2 (NSDictionary-objectForKey)
     NSDictionary *temp_array = [NSJSONSerialization JSONObjectWithData:json options:0 error:nil];
     // NSDictionaryにセットされた値からまずresponseを取り出してtemp_arrayに再セット
     temp_array = [temp_array objectForKey:@"response"];
     // さらにresultを取り出してtemp_arrayに再セット
     NSDictionary *array = [temp_array objectForKey:@"result"];
     // 要素数取得
     const unsigned long cnt = [array count];
    
    
    // JSONの配列を整理しないでそのまま表示
    //NSLog(@"json全文：%@", array);
    
    
    
     // パターン2 (NSDictionary-objectForKey)
     // JSONの配列からtitle,url,lastmodifiedを抽出して出力
     for (NSDictionary *out_array in array) {
     NSLog(@"ファイル名：%@　URL：%@　最終更新：%@", [out_array objectForKey:@"title"], [out_array objectForKey:@"url"], [out_array objectForKey:@"lastModified"]);
     }
    
    
    // 定数cntの取得状況チェック
    NSLog(@"定数cnt:%ld",cnt);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        getfessjson_pt1(); // パターン1
        //getfessjson_pt2(); // パターン2
    }
    return 0;
}
