//
//  ViewController.m
//  UI18_NSURLSession
//
//  Created by dllo on 16/1/6.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDelegate, NSURLSessionDataDelegate, NSURLSessionTaskDelegate>

// 用来接收数据

@property (nonatomic, retain)NSMutableData *data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

#pragma mark -- 知识点 1 get 获取数据,通过 block 回调

- (IBAction)handleGETByBlock:(id)sender {
    
    
    
    // URL
    
    NSString *str = @"http://mobile.ximalaya.com/m/explore_album_list?category_name=all&condition=hot&device=android&page=1&per_page=20&status=0&tag_name=%E5%8D%81%E4%BA%8C%E6%98%9F%E5%BA%A7";
    
    NSURL *url = [NSURL URLWithString:str];
    
    NSLog(@"URL : %@", url);
    
    // 创建 session 建通道
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    
    // 创建任务 (task)
    
    /** block 解析*/
    NSURLSessionDataTask *task =[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
      
      // block 中的参数,就是从服务器获取的数据
      NSLog(@"%@", response);
      
      // data 进行解析 (JSON格式)
      NSError *errorJson = nil;
      
      id resule = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&errorJson];
      
      NSLog(@"result:%@", resule);
      NSLog(@"%@", data);
      
      // 转成字符串
      
      NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
      NSLog(@"str:%@", str);
    }];
    
    // 开始任务
    [task resume];
    
}


#pragma mark -- 知识点 2 get 获取数据 ,通过 delegate 回调

- (IBAction)handleGETByDelegate:(id)sender {
    
    // 初始化数据
    
    self.data = [NSMutableData data];
    
    //URL
    NSURL *url = [NSURL URLWithString:@"http://mobile.ximalaya.com/m/explore_album_list?category_name=all&condition=hot&device=android&page=1&per_page=20&status=0&tag_name=%E5%8D%81%E4%BA%8C%E6%98%9F%E5%BA%A7"];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    // 添加任务
    NSURLSessionDataTask *task = [session dataTaskWithURL:url];
    
    // 开始任务
    [task resume];
    
}

#pragma mark -- 协议方法


    /** 当从服务器接收到响应的时候,调用此方法  NSURLSessionDataDelegate 协议方法, 需要 response 时才需要这个方法,不一定要实现*/
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveResponse:(NSURLResponse *)response completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler{
    
    NSLog(@"%@", response);
    
    // 加上下面这个方法会允许执行下面的方法
    completionHandler (NSURLSessionResponseAllow);
}

    /**  当接收数据的时候会调用此方法.此方法可能会调用多次  **/
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data{
    

    // 将数据进行拼接
    [self.data  appendData:data];


}

    /**  当接任务完成之后,调用此方法, 调用次数取决于任务的数量 */
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error{
    // 解析
    NSError *errorOfJSON = nil;
    id result = [NSJSONSerialization JSONObjectWithData:self.data options:NSJSONReadingMutableContainers error:&errorOfJSON];

    NSLog(@"%@", result);

}



#pragma mark --知识点 3 : POST 获取数据, Block 回调

- (IBAction)handlePOSTByBlock:(id)sender {
    
    //URL
    NSURL *url = [NSURL URLWithString:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?date=20131129&startRecord=1&len=15&udid=1234567890&terminalType=Iphone&cid=213"];

    //UELRequest (网络请求)
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"username=daka&pwd=123" dataUsingEncoding:NSUTF8StringEncoding];
    
    
    // session 对象 (通道)
    NSURLSession *session = [NSURLSession sharedSession];
    
    //添加任务
    NSURLSessionDataTask *task =  [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //解析
        NSError *errorJson = nil;
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&errorJson];
    
        NSLog(@"%@", result);

    }];
    
    //开始任务
    [task resume];
    
}

#pragma mark -- 知识点 4 :POST 获取数据, Delegtate 回调

- (IBAction)handlePOSTByDelegate:(id)sender {
    
    self.data = [NSMutableData data];
    
    //URL
    NSURL *url = [NSURL URLWithString:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?date=20131129&startRecord=1&len=15&udid=1234567890&terminalType=Iphone&cid=213" ];
    
    
    //URLRequest
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"username=daka&pwd=123" dataUsingEncoding:NSUTF8StringEncoding];

    
    // Session (通道)
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    
    //添加任务
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request];

    //解析调用上面代理方法
    
    //开始执行
    [task resume];
}

















#pragma mark ----



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
