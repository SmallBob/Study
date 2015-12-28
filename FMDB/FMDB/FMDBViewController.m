//
//  FMDBViewController.m
//  FMDB
//
//  Created by 王凯 on 15/12/23.
//  Copyright © 2015年 wk. All rights reserved.
//

#import "FMDBViewController.h"
#import <FMDatabase.h>

@interface FMDBViewController ()

@property(nonatomic,strong)FMDatabase*db;

@end

@implementation FMDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1文件路径
    NSString*doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    NSString*fileName = [doc stringByAppendingPathComponent:@"student.sqlite"];
    NSLog(@"fileName ----- %@",fileName);
    
    
    //2 获取数据库
    FMDatabase*db = [FMDatabase databaseWithPath:fileName];
    
    //3 打开数据库
    
    if ([db open]) {
        NSLog(@"ok");
    }else{
        return;
    }
    
    BOOL result = [db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student(id integer PRIMARY KEY AUTOINCREMENT, name text NOT NULL ,age integer NOT NULL);"];                                                           
    if (result) {
        NSLog(@"创建表成功");
    }else{
    
        NSLog(@"创建表失败");
    }
    
    self.db = db;
    //插入数据
    
    [self insertStu];
    [self deleteStu:6];
    [self updateStu:@"apple7_name" :@"7777"];
    [self queryStu];
    [self dropStu];
    [self insertStu];
    [self queryStu];
    
    
    //关闭数据库
    [self.db close];
    
    
    // Do any additional setup after loading the view.
}
#pragma mark 插入数据
-(void)insertStu
{
    NSLog(@"-------插入数据");
    for (int i = 0 ; i < 10; i++) {
        NSString * name = [NSString stringWithFormat:@"1apple%i_name",i];
        int age = arc4random()%3 + 20;
        
        //1. executeUpdate : 不确定的参数用?来占位 (后面参数必须都是oc对象)
        [self.db executeUpdate:@"INSERT INTO t_student(name ,age )VALUES(?,?);",name,@(age)];
        
        //2. executeUpdateWithFormat : 不确定的参数用%@、%d等来占位 （参数为原始数据类型）
        
        // [self.db executeUpdateWithFormat:@"insert into t_student (name, age) values (%@, %i);",name,age];
        
        //3. 数组
        // [self.db executeUpdate:@"INSERT INTO t_student (name, age) VALUES (?,?);" withArgumentsInArray:@[name,@(age)]];
        
    }

}

#pragma mark 删除数据
-(void)deleteStu:(int)idNum
{
    NSLog(@"-------输出数据");
    //a. executeUpdate : 不确定的参数用?来占位 (后面参数必须都是oc对象)
    // [self.db executeUpdate:@"delete from t_student where id=?;",@(idNum)];
    //b. executeUpdateWithFormat : 不确定的参数用%@、%d等来占位
    // [self.db executeUpdateWithFormat:@"delete from t_student where name=%@;",@"apple9_name"];
    
}
#pragma mark 销毁表格
-(void)dropStu
{
    NSLog(@"-------销毁数据");
    [self.db executeStatements:@"drop table if exists t_student;"];
    
    //重新创建表
    BOOL result = [self.db executeUpdate:@"CREATE TABLE IF NOT EXISTS t_student (id integer PRIMARY KEY AUTOINCREMENT,name text NOT NULL ,age integer NOT NULL);"];
    if (result) {
        NSLog(@"再次创建表成功");
    }else{
        NSLog(@"再次创建表失败");
    }
}

#pragma mark 修改数据
-(void)updateStu:(NSString *)oldName :(NSString*)newName
{
    NSLog(@"-------修改数据");
    [self.db executeUpdate:@"update t_student set name = ? where name = ?",newName,oldName];
    
    
    
}

#pragma mark 查询数据
-(void)queryStu
{
    NSLog(@"-------查询数据");
    FMResultSet * resultSet = [self.db executeQuery:@"select * from t_student where id < ? ;",@(25)];
    while ([resultSet next]) {
        int idNum = [resultSet intForColumn:@"id"];
        NSString*name = [resultSet objectForColumnName:@"name"];
        int age = [resultSet intForColumn:@"age"];
        NSLog(@"id=%i ,name=%@, age=%i",idNum,name,age);
    }

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
