//
//  ViewController.m
//  UI16_UITabBarController
//
//  Created by dllo on 16/1/4.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, retain) UIButton *button;

@end

@implementation ViewController

- (void)dealloc{
    
    [_button release];
    [super dealloc];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createButton];
    
}



- (void)createButton{
    
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    self.button.frame = CGRectMake(100, 100, self.view.frame.size.width - 200, 50);
    [self.view addSubview:self.button];
    self.button.backgroundColor = [UIColor yellowColor];
    [self.button setTitle:@"NEXT" forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];

}


- (void)backAction:(UIButton *)button{

    // 跳转到下一页
    self.tabBarController.selectedIndex = 1;

}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
