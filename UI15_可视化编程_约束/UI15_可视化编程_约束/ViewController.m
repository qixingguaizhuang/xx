//
//  ViewController.m
//  UI15_可视化编程_约束
//
//  Created by dllo on 15/12/31.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "ViewCellOfMovie.h"
#import "ModelForList.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, retain)UITableView *tableView;
@property (nonatomic, retain)NSMutableArray *arr;


@end

@implementation ViewController

- (void)dealloc{
    [_tableView release];
    [_arr release];
    [super dealloc];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self creatTableView];
    [self handleData];
}


/** 数据处理部分 */

- (void)handleData{

    self.arr = [NSMutableArray array];
    
    /* 解析 JSON */
    NSString *path = [[NSBundle mainBundle] pathForResource:@"activitylist" ofType:@"txt"];
    
    /** 将文件转换为 二进制数据对象 */
    NSData *data = [NSData dataWithContentsOfFile:path];
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    /** 数据处理 */
    NSArray *arr = [result objectForKey:@"events"];
    
    for (NSDictionary *dic in arr) {
        
        ModelForList *model = [[ModelForList alloc]init];
        [model setValuesForKeysWithDictionary:dic];
        [self.arr addObject:model];
        [model release];
    }
}


#pragma mark -- 创建 tableView

- (void)creatTableView{


    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [_tableView release];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ViewCellOfMovie" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"pool1"];
    
}


#pragma mark -- DataSource 协议方法

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ViewCellOfMovie *cell = [tableView dequeueReusableCellWithIdentifier:@"pool1"];

    ModelForList * model = [self.arr objectAtIndex:indexPath.row];
    
    [cell handleData:model];

    return cell;


}


#pragma mark -- Delegate 协议方法


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
