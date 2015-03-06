//
//  TableViewController.m
//  test100
//
//  Created by macbook on 2015/03/06.
//  Copyright (c) 2015年 macbook. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()
// property*itemsは手入力、ストーリーボードとのひもづけなし
@property (nonatomic, strong) NSArray *items;
@end

@implementation TableViewController
// itemsへのsynthesize
@synthesize items;

- (void)viewDidLoad {
    [super viewDidLoad];
    // 空の配列を用意
    self.items = [NSArray array];
    [self getJSON];
    //NSLog(@"viewDidLoad called");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getJSON
{
    // JSON取得のURL準備
    // 検索語
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
    
    // JSONをパース(NSDictionary-objectForKey)
    NSDictionary *temp_array = [NSJSONSerialization JSONObjectWithData:json options:0 error:nil];
    // NSDictionaryにセットされた値からまずresponseを取り出してtemp_arrayに再セット
    temp_array = [temp_array objectForKey:@"response"];
    // アプリデータの配列をプロパティに保持
    self.items = [temp_array objectForKey:@"result"];
    
    // TableView をリロード、ストーリーボードと名前を合わせる
    [self.tableView reloadData];
    //NSLog(@"getJSON called");
}

// セル数を返す(tableview必須メソッド)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"cell数:%ld",[items count]);
    return [items count];
    //NSLog(@"numberOfSectionsInTableView called");
}

// セルへの値入力(tableview必須メソッド)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 代表セルのID定義、ストーリーボードと合わせる
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // 代表セルがない場合の設定、たぶん自動で作る感じ
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    // indexPath.rowの値をインデックスに、1グループずつJSON情報をitemに格納
    NSDictionary *item = [items objectAtIndex:indexPath.row];
    // セルにタイトルとサブタイトルを表示
    cell.textLabel.text = [item objectForKey:@"title"];
    cell.detailTextLabel.text=[item objectForKey:@"url"];
    
    return cell;
    //NSLog(@"cellForRowAtIndexPath called");
}

@end