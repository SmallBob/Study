//
//  Person.h
//  per
//
//  Created by developer_k on 16/4/6.
//  Copyright © 2016年 developer_k. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;
@protocol PersonDelegate <NSObject>

-(void)personDeletageToWork;

@end

@interface Person : NSObject
@property(nonatomic,weak)id<PersonDelegate>delegate;
@property(nonatomic,copy)NSString * name;
@property(nonatomic,copy)NSString * sex;


-(void)eat;
-(void)sleep;


@end
