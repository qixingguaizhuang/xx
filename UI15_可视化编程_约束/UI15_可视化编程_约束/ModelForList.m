//
//  ModelForList.m
//  UI15_可视化编程_约束
//
//  Created by dllo on 15/12/31.
//  Copyright © 2015年 dllo. All rights reserved.
//

#import "ModelForList.h"

@implementation ModelForList

- (void)dealloc{

    [_address release];
    [_begin_time release];
    [_category_name release];
    [_end_time release];
    [_participant_count release];
    [_wisher_count release];
    [_title release];
    [super dealloc];

}


- (void)setValue:(id)value forUndefinedKey:(NSString *)key{

}





@end
