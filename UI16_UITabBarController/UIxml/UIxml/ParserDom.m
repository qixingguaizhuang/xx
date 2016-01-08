//
//  ParserDom.m
//  UIxml
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ParserDom.h"
#import "GDataXMLNode.h"
#import "ModelForStudent.h"

@interface ParserDom ()

//解析之后,存放 model 的地方
@property (nonatomic, retain) NSMutableArray *arr;

@end

@implementation ParserDom

- (NSArray *)parserDOMWithFile:(NSString *) filePath{
    
    self.arr = [NSMutableArray array];
    
    // 创建GDataXMLDocument对象.
    NSError *error = nil;
    GDataXMLDocument *document = [[GDataXMLDocument alloc]initWithData:[NSData dataWithContentsOfFile:filePath] options:1 error:&error];
    
    // 获取根元素.
    GDataXMLElement *root = [document rootElement];
    NSLog(@"root:%@",root);
    
    
    // 获取所有 < student > 子元素
    
    NSArray *arr = [root elementsForName:@"student"];
    
    for (GDataXMLElement *element in arr) {
        
        // 创建 model
        ModelForStudent *model =[[ModelForStudent alloc]init];
        
        model.name = [[[element elementsForName:@"name"] lastObject] stringValue];
        
        model.age = [[[element elementsForName:@"age"] lastObject] stringValue];
        
        model.sex = [[[element elementsForName:@"sex"] lastObject] stringValue];
        
        model.number = [[[[element elementsForName:@"number"] lastObject] stringValue] integerValue];
        
        [self.arr addObject:model];
        
        
    }
    
    
    return self.arr;

}

@end
