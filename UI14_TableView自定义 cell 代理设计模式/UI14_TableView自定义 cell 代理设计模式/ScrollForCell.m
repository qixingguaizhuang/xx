//
//  ScrollForCell.m
//  UI14_TableView自定义 cell 代理设计模式
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 doll-61. All rights reserved.
//

#import "ScrollForCell.h"

@implementation ScrollForCell


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    /** 响应者链 传递 */

    NSLog(@"%@",[[[[self nextResponder] nextResponder] nextResponder] nextResponder]);

    [self.nextResponder.nextResponder.nextResponder.nextResponder touchesBegan:touches withEvent:event];

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    
    [self.nextResponder.nextResponder.nextResponder.nextResponder touchesEnded:touches withEvent:event];


}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
