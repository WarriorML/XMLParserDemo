//
//  XMLParser.m
//  XMLParserDemo
//
//  Created by MengLong Wu on 16/9/7.
//  Copyright © 2016年 MengLong Wu. All rights reserved.
//

#import "XMLParser.h"

@implementation XMLParser

- (id)init
{
    self = [super init];
    if (self) {
//        初始化数组
        _studentArray = [[NSMutableArray alloc]init];
//        获取xml文件的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"xml"];
        
//        创建解析类，并指定解析的url
        _parser = [[NSXMLParser alloc]initWithContentsOfURL:[NSURL fileURLWithPath:path]];
//        设置代理，解析数据
        _parser.delegate = self;
        
    }
    return self;
}

- (void)startParser
{
//  parse 开始解析
    [_parser parse];
}
#pragma mark -NSXMLParser协议方法
//获取开始节点
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    self.startElement = elementName;
    if ([self.startElement isEqualToString:@"student"]) {
//        当开始节点为student时，创建student对象
        _student = [[Student alloc]init];
    }
    
}
//发现节点之间的内容
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
//    判断开始节点，并把标签之间的内容赋值给student对象的相应属性
    if ([self.startElement isEqualToString:@"sid"]) {
        _student.sid = string;
    }else if ([self.startElement isEqualToString:@"name"]){
        _student.name = string;
    }else if ([self.startElement isEqualToString:@"sex"]){
        _student.sex = string;
    }else if ([self.startElement isEqualToString:@"age"]){
        _student.age = string;
    }
}
//获取结束节点
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
//    获取到结束节点时，把记录的开始节点置为nil
    self.startElement = nil;
    
    if ([elementName isEqualToString:@"student"]) {
//        获取到student的结束节点，把student对象添加到数组中
        [_studentArray addObject:_student];
    }else if ([elementName isEqualToString:@"person"]){
//        当获取到最后一个结束节点时，停止解析
        [_parser abortParsing];
    }
}



















@end
