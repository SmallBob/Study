//
//  ViewController.m
//  per
//
//  Created by developer_k on 16/4/6.
//  Copyright © 2016年 developer_k. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    [self test1];

    // Do any additional setup after loading the view, typically from a nib.
}
//成员变量
-(void)test1{

    unsigned int count;
    Ivar *ivars = class_copyIvarList([Person class], &count);

    for (int i= 0 ; i< count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);

        NSString*key = [NSString stringWithUTF8String:name];
        NSLog(@"%d==%@",i,key);
    }
    free(ivars);



}

//属性名
-(void)test2{
    unsigned int count;
    objc_property_t *properties = class_copyPropertyList([Person class], &count);

    for (int i= 0 ; i<count; i++) {
        objc_property_t property = properties[i];
        const char *name = property_getName(property);

        NSString *key = [NSString stringWithUTF8String:name];
        NSLog(@"%d==%@",i,key);
    }
    free(properties);
}

//类的全部方法
-(void)test3
{
    unsigned int count;
    Method *methods = class_copyMethodList([Person class], &count);

    for (int i = 0 ; i<count; i++) {
        Method method = methods[i];

        SEL methodSel =  method_getName(method);

        const char *name = sel_getName(methodSel);
        NSString *methoName = [NSString stringWithUTF8String:name];

        int argumentes = method_getNumberOfArguments(method);
        NSLog(@"%d==%@ %d",i,methoName,argumentes);
    }
    free(methods);

}

-(void)test4
{
    unsigned int count;

    __unsafe_unretained Protocol **protocols = class_copyProtocolList([Person class], &count);

    for ( int i= 0; i < count; i++) {
        Protocol *protocol = protocols[i];
        const char *name = property_getName((__bridge objc_property_t)(protocol));
        NSString * proto = [NSString stringWithUTF8String:name];
        NSLog(@"%d == %@",i,proto);
    }
    free(protocols);













}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
