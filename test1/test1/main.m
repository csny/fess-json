//
//  main.m
//  test1
//
//  Created by macbook on 2015/02/28.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import <Foundation/Foundation.h>

// FESSサーバAPIからJSON形式で
// なにかを表示する。
// qiitaの以下の記事から丸パクリ
// http://qiita.com/drapon/items/859473840211f0ac1552
void searchresultlist()
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
    // JSONをパース
    NSArray *array = [NSJSONSerialization JSONObjectWithData:json options:NSJSONReadingAllowFragments error:nil];
    
    // JSONの配列を整理しないでそのまま表示
    //NSLog(@"json全文：%@", array);
    
    // JSONの配列からi番目のtitle,url,lastmodifiedを抽出して出力
    // 階層（入れ子）構造になっていれば"."で区切って、全階層を記述する
    // FESSのデフォルトは20件ずつ表示なので、定数で入れちゃった
    for (int i=0;i<20;i++){
        NSLog(@"ファイル名：%@　URL：%@　最終更新：%@", [[array valueForKeyPath:@"response.result.title"] objectAtIndex:i], [[array valueForKeyPath:@"response.result.url"] objectAtIndex:i], [[array valueForKeyPath:@"response.result.lastModified"] objectAtIndex:i]);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        searchresultlist();
    }
    return 0;
}
