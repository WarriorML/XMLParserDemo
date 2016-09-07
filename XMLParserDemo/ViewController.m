//
//  ViewController.m
//  XMLParserDemo
//
//  Created by MengLong Wu on 16/9/7.
//  Copyright © 2016年 MengLong Wu. All rights reserved.
//

#import "ViewController.h"
#import "XMLParser.h"

#import "GDataXMLNode.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    XMLParser *parser = [[XMLParser alloc]init];
    
    [parser startParser];
    
    NSLog(@"%@",parser.studentArray);
    
    [self GDataXMLParser];
    
}
- (void)GDataXMLParser
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test" ofType:@"xml"];
    
//    把xml转化为二进制数据
    NSData *data = [[NSData alloc]initWithContentsOfFile:path];
//    获取xml文档
    GDataXMLDocument *document = [[GDataXMLDocument alloc]initWithData:data options:1 error:nil];
    
//    获取根节点
    GDataXMLElement *rootElement = [document rootElement];
    
//    根据节点名字获取到这个类型的节点，返回数组
    NSArray *array = [rootElement elementsForName:@"student"];
    
//    遍历数组，获取每一个节点
    for (GDataXMLElement *student in array) {
//        获取sid节点
        GDataXMLElement *sidElement = [[student elementsForName:@"sid"] firstObject];
//        获取节点间内容
        NSString *sid = [sidElement stringValue];
        
//        获取name节点
        GDataXMLElement *nameElement = [[student elementsForName:@"name"] firstObject];
        
        NSString *name = [nameElement stringValue];
        
//        获取sex节点
        GDataXMLElement *sexElement = [[student elementsForName:@"sex"] firstObject];
        
        NSString *sex = [sexElement stringValue];
        
//        获取age节点
        GDataXMLElement *ageElement = [[student elementsForName:@"age"] firstObject];
        
        NSString *age = [ageElement stringValue];
        
        NSLog(@"sid:%@ name:%@ sex:%@ age:%@",sid,name,sex,age);
    }
}






@end
