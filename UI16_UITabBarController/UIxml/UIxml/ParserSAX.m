//
//  ParserSAX.m
//  UIxml
//
//  Created by dllo on 16/1/5.
//  Copyright © 2016年 dllo. All rights reserved.
//

#import "ParserSAX.h"
#import "ModelForStudent.h"

@interface ParserSAX ()<NSXMLParserDelegate>

/* 用来保存标签之间的值 content 解析时的内容*/
@property (nonatomic, copy)NSString *content;
@property (nonatomic, retain)NSMutableArray *arr;

@end

@implementation ParserSAX


- (NSArray *)parserSAXWithFile:(NSString *)filePath{
    
    self.arr = [NSMutableArray array];
    
    // NSXMLParser 创建对象

    NSXMLParser *xmlPar = [[NSXMLParser alloc ]initWithData:[NSData dataWithContentsOfFile:filePath]];
    
    /** 数据通过协议回调出来的,指定代理人 */
    xmlPar.delegate = self;
    
    /** 开始解析 */
    [xmlPar parse];

    return self.arr;

}



#pragma mark -- xmlParser 协议方法

/** 读到开始标签的时候,调用此方法 */

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{

    NSLog(@"start:%@", elementName);
    
    // 读到 <student> 子标签时 创建 model 数组
    
    if ([elementName isEqualToString:@"student"]) {
        
        ModelForStudent *model= [[ModelForStudent alloc] init];
        
        [self.arr addObject:model];
        
    }
}



/** 读到标签之间的值的时候,调用此方法 */

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{

    NSLog(@"string:%@",string);
    
    self.content = string;

}


/** 读到结束标签的时候,调用此方法 */

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{


    NSLog(@"end:%@",  elementName);
    
    //指向数组中最后一个 model 对象 赋值
    
     ModelForStudent *model = [self.arr lastObject];
    
    if ([elementName isEqualToString:@"name"]) {
        
        model.name =self.content;
        
        
    }else if ([elementName isEqualToString:@"age"]){
    
        model.age = self.content;
        
        
    }else if ([elementName isEqualToString:@"sex"]){
    
        model.sex = self.content;
    
    
    }else if ([elementName isEqualToString:@"number"]){
    
        model.number = self.content.intValue;
    }
    
    
    NSLog(@"%@", model);
    
    

}


@end
