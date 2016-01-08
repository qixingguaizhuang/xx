//
//  ViewController.m
//  UI19_API_SDWebImage
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"
#import "NetWorkHandler.h"

@interface ViewController ()<networkHandlerDelegate, UITableViewDataSource
, UITableViewDelegate>

@property (nonatomic, retain)NSMutableArray *arr;
@property (nonatomic, retain)UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self handleData];
    [self creatTableView];
}




- (void)handleData{

NSString *str = @"http://api.m.mtime.cn/News/NewsList.api?pageIndex=1";
    
    [NetWorkHandler handlerJSONWithURL:str delegate:self];

}


#pragma  mark - networkHandle delegate


- (void)handleDidComplete:(id)resule{
    self.arr = [NSMutableArray array];
    
    NSArray *arr = [resule objectForKey:@"newsList"];
    
    for (NSDictionary *dic in arr) {
        
        NSString *imageURL = [dic objectForKey:@"image"];
        
        [self.arr addObject:imageURL];
    }
    
    [self.tableView reloadData];

}




- (void)creatTableView{


    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [_tableView release];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"pool1"];
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return  self.arr.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:self.arr[indexPath.row]] placeholderImage:[UIImage imageNamed:@"1.jpg"]];
    
    return cell;

}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
