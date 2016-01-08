//
//  ViewController.m
//  UI19_ 网络封装(delegate 回调)
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "NetWorkHandler.h"

@interface ViewController ()<networkHandlerDelegate, UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, retain)UITableView *tableView;
@property (nonatomic ,retain)NSMutableArray * arr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self handleData];
    [self createTableView];
    
}



- (void)handleData{

    NSString *str = @"http://api.map.baidu.com/place/v2/search?query=银行&region=大连&output=json&ak=6E823f587c95f0148c19993539b99295";
    
    /* 接口1*/
//    NetWorkHandler *handler = [[NetWorkHandler alloc] init];
//    
//    handler.delegate = self;
//    
//    [handler networkHandlerJSONWithURL:str];
 
    
    
  /* 使用接口 2 类方法封装 */
    
    
    [NetWorkHandler handlerJSONWithURL:str delegate:self];
    
    
    

}

#pragma mark ---实现协议方法


- (void)handleDidComplete:(id)resule{

    
    self.arr = [NSMutableArray array];
    
    NSArray *arr = [resule objectForKey:@"results"];
    
    for (NSDictionary *dic in arr) {
        
    [self.arr addObject:[dic objectForKey:@"name"]];
        
    }
    
    [self.tableView reloadData];

}


- (void)createTableView{


    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"pool1"];
    

}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    NSLog(@"%ld", self.arr.count);
    return  self.arr.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
    
    cell.textLabel.text = [self.arr objectAtIndex:indexPath.row];

    return cell;

}













- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
