//
//  ViewController.m
//  UI16_可视化编程_StoryBoard
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 GH. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController






- (IBAction)handleNext:(id)sender {
    //跳转下一页
//    SecondViewController *second = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:[NSBundle mainBundle]];
//    [self.navigationController pushViewController:second animated:YES];
//    [second release];
//    
    /** 当VC的xib文件名和VC类的名字一样时  初始化方法可以使用init 系统会去首先去找和vc 类相同的xib 文件 */
    SecondViewController *second = [[SecondViewController alloc] init];
    
    [self.navigationController pushViewController:second animated:YES];
    
}






- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
