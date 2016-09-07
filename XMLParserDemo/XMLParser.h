//
//  XMLParser.h
//  XMLParserDemo
//
//  Created by MengLong Wu on 16/9/7.
//  Copyright © 2016年 MengLong Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"
@interface XMLParser : NSObject<NSXMLParserDelegate>

@property (nonatomic,strong)NSMutableArray  *studentArray;

//NSXMLParser 系统XML解析类(SAX解析)
@property (nonatomic,strong)NSXMLParser *parser;

//记录每次获取的开始节点
@property (nonatomic,copy)NSString *startElement;

//模型对象
@property (nonatomic,strong)Student *student;

//开始解析
- (void)startParser;

@end
