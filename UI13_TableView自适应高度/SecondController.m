//
//  SecondController.m
//  UI13_TableView自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 GH. All rights reserved.
//

#import "SecondController.h"

#import "cellForimage.h"

@interface SecondController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain)UITableView *tableView;
@property (nonatomic, retain) NSArray *arr;

@end


@implementation SecondController


- (void)dealloc{
   
    [_tableView release];
    [_arr release];
    [super dealloc];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self tableViewSubView];
    [self handeleDate];
    
}



- (void)handeleDate{

    self.arr = @[@"2.jpg",@"b1.jpg",@"b3.jpg"];
}

- (void)tableViewSubView{
    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    [_tableView release];
    
      self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    [self.tableView registerClass:[cellForimage class] forCellReuseIdentifier:@"pool"];

}


#pragma mark -- DateSource 协议方法


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return  self.arr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    cellForimage *cell = [tableView dequeueReusableCellWithIdentifier:@"pool"];
    
    //赋值
    
    cell.imageViewForPic.image = [UIImage imageNamed:[self.arr objectAtIndex:indexPath.row]];
                                  
    return cell;
}


    // 设定高度 协议方法
#pragma mark - delegate 协议方法

    /**  返回每一行的高度 **/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    /** 从数组中取出字符串 **/

    NSString *name = [self.arr objectAtIndex:indexPath.row];
    
    /** 调用 cell 方法, 计算高度 **/
    return [[cellForimage class] heightForCellWithName:name] ;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
