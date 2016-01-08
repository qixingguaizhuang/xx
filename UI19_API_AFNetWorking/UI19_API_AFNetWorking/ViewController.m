//
//  ViewController.m
//  UI19_API_AFNetWorking
//
//  Created by dllo on 16/1/7.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "AFURLSessionManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self handleData];
    
}


- (void)handleData{
    
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSURL *URL = [NSURL URLWithString:@"https://frodo.douban.com/api/v2/recommend_feed?udid=8dc3f36a586f27a017cdd1f069f6eab70b1dae91&apikey=0dad551ec0f84ed02907ff5c42e8ec70&channel=WanDouJia_Parter&next_date=2016-01-06&since_id=98025&device_id=8dc3f36a586f27a017cdd1f069f6eab70b1dae91&os_rom=android"];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
            
            
             // NSLog(@"%@",responseObject);
        }
    }];
    
    
    
  
    
    [dataTask resume];




}










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
