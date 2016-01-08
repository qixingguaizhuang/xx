//
//  ViewController.m
//  UIxml
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"
#import "ParserSAX.h"
#import "ModelForStudent.h"
#import "ParserDom.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - 知识点1 :XML SAX 解析

- (IBAction)handleSAX:(id)sender {
    
    ParserSAX *perser = [[ParserSAX alloc]init];
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"Student" ofType:@"xml"];
    
    NSArray *arr = [perser parserSAXWithFile:path];
    
    NSLog(@"%@",arr);
    
    for ( ModelForStudent *stu in arr) {
        
        NSLog(@"name:%@", stu.name);
    }

}


#pragma mark -- 知识点二 xml DOM 解析

- (IBAction)handleDOM:(id)sender {
    
    
    ParserDom *domPar = [[ParserDom alloc] init];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Student" ofType:@"xml"];
    
  NSArray *arr =  [domPar parserDOMWithFile:path];

    
    NSLog(@"%@", arr);
    
    for (ModelForStudent *stu in arr) {
        
        NSLog(@"%@", stu.name);
    }
  
}


#pragma mark -- 知识点三 JSON 解析
- (IBAction)handleJSON:(id)sender {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"activitylist" ofType:@"txt"];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSError *error = nil;
    
    id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    NSLog(@"%@", result);
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
