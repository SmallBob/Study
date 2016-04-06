//
//  Person.m
//  per
//
//  Created by developer_k on 16/4/6.
//  Copyright © 2016年 developer_k. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>

@interface Person()<NSCopying>

@end

@implementation Person
-(void)eat{

}

-(void)sleep
{

}


-(void)encodeWithCoder : (NSCoder *)aCoder
{


}

-(instancetype)initWithCoder : (NSCoder *)aDecoder{

    return self;
}


-(id)copyWithZone:(NSZone *)zone
{
    return self;
}

@end
