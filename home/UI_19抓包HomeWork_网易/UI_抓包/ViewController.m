//
//  ViewController.m
//  UI_抓包
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "PhotoOfhead.h"
#import "NetWorkHandler.h"
#import "ModelOfPag1.h"
#import "CellOfContect.h"


@interface ViewController ()<networkHandlerDelegate,UITableViewDataSource, UITableViewDelegate,UITableViewDelegate>

@property(nonatomic, retain)UITableView *tableView;
@property (nonatomic, retain)NSMutableArray *arr;
@property (nonatomic, retain)NSMutableDictionary *dic;
@property (nonatomic, retain)ModelOfPag1 *model;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self handleData];
    [self createTableView];
    [self createScrollView];
}


- (void)handleData{

NSString *url = @"http://c.m.163.com/nc/article/headline/T1348647853363/0-140.html";
    
    [NetWorkHandler handlerJSONWithURL:url delegate:self];


}


// 实现协议方法

- (void)handleDidComplete:(id)resule{
    
    self.dic = [NSMutableDictionary dictionary];
    
    NSArray *arr = [resule objectForKey:@"T1348647853363"];
    
    /** 初始化数组用于存放 model*/
    
    self.arr = [NSMutableArray array];
    
    
    for (NSMutableDictionary *dic in arr) {
        
       ModelOfPag1 *model = [[ModelOfPag1 alloc] init];
        
        [model setValuesForKeysWithDictionary:dic];
        [self.arr addObject:model];
        
    }
    
    //[self.dic setObject:self.arr forKey:@"T1348647853363"];
    
    [self.tableView reloadData];
    
}







- (void)createTableView{

    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    //self.tableView.separatorColor = [UIColor redColor];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    
    


    /** 图片轮播图 */
    [self createScrollView];


    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"pool1"];
    
    [self.tableView registerClass:[CellOfContect class] forCellReuseIdentifier:@"pool1"];
    

    [self.tableView reloadData];
}



/** 头轮播图**/

- (void)createScrollView{
    

    
    PhotoOfhead *photo = [[PhotoOfhead alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,200) images:@[@"1.jpg", @"2.jpg", @"3.jpg"]];
    
    
    
    self.tableView.tableHeaderView = photo;
    [self.tableView addSubview:photo];


}





- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

  // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];
    
    CellOfContect *cell= [tableView dequeueReusableCellWithIdentifier:@"pool1"];
    
    ModelOfPag1 *model = [self.arr objectAtIndex:indexPath.row];
   
    [cell passModel:model];
    
    return cell;


}






- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return 110;

}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
