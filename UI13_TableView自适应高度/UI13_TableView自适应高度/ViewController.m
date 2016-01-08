//
//  ViewController.m
//  UI13_TableView自适应高度
//
//  Created by dllo on 15/12/29.
//  Copyright © 2015年 GH. All rights reserved.
//

#import "ViewController.h"
#import "CellOFNews.h"
#import "ModelOFNew.h"
#import "SecondController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic ,retain)UITableView *tableview;
@property (nonatomic, retain)NSMutableArray *arrModel;


@end

@implementation ViewController


- (void) dealloc{

    [_tableview release];
   
    [super dealloc];

}



- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self creatView];
     [self handleData];
    
}


-(void)creatView{
   
    self.tableview = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    [self.view addSubview:self.tableview];
    
    [_tableview release];
    
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    
    [self.tableview registerClass:[CellOFNews class] forCellReuseIdentifier:@"poll1"];
    
    

    
}









- (void)handleData{
    
    //初始化数组
    
    self.arrModel = [NSMutableArray array];
  
    NSString *path = [[NSBundle mainBundle]pathForResource:@"R" ofType:@"txt"];
   
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    
    /** 取出数组*/
    NSArray *arr = [result objectForKey:@"news"];
    
    /** 遍历数组,将数组中的字典转换成 model */
    

    for (NSDictionary *dic in arr) {
        
        
        ModelOFNew * model = [[ModelOFNew alloc] init];
        [model setValuesForKeysWithDictionary:dic];
        [self.arrModel addObject:model];
        [model release];
        
    }

}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.arrModel.count;

}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    CellOFNews *cell = [tableView dequeueReusableCellWithIdentifier:@"poll1"];
    
    // cell 赋值
    
    ModelOFNew *model = [self.arrModel objectAtIndex:indexPath.row];
    
    [cell passModel:model];
    
    
    return cell;

}


/*返回每行的高度*/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{


    ModelOFNew *model = [self.arrModel objectAtIndex:indexPath.row];
    
  /** 通过 cell 的计算高度方法, 返回高度值 */
  return  [CellOFNews heightForCell:model];
    
}


/** 点击 cell 之后调用此方法 进行跳转 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SecondController *second = [[SecondController alloc] init];
    
    [self.navigationController pushViewController:second animated:YES];
    
    [second release];
    

}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
