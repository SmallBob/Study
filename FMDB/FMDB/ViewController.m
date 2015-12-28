//
//  ViewController.m
//  FMDB
//
//  Created by 王凯 on 15/12/23.
//  Copyright © 2015年 wk. All rights reserved.
//

#import "ViewController.h"
#import "FMDB.h"

@interface ViewController ()

@property(nonatomic,strong)FMDatabase * db;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)oneButton:(UIButton *)sender {
    
    [self initData];
}

- (IBAction)twoButton:(UIButton *)sender {
    
    [self resultData];
}

- (IBAction)threeButton:(UIButton *)sender {
    
   BOOL result =  [self.db executeUpdate:@"drop table if exists PersonList;"];
    if (result) {
        NSLog(@"删除成功");
    }else{
        NSLog(@"删除失败");
    }

}


-(void)initData{
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * documentDirectory = [paths objectAtIndex:0];
    NSString * dbPath = [documentDirectory stringByAppendingPathComponent:@"MyDatabase.db"];
     self.db =[FMDatabase databaseWithPath:dbPath];
    if (![ self.db open]) {
        NSLog(@"Could not open db");
        
        return;
    }
    
    //建立 table 库
    BOOL result=[self.db executeUpdate:@"CREATE TABLE PersonList (Name text, Age integer ,Sex integer ,Phone text)"];
    if (result) {
        NSLog(@"创表成功");
    }else{
        NSLog(@"创表失败");
    }
    //增
    [self.db executeUpdate:@"INSERT INTO PersonList (Name , Age  ,Sex  ,Phone ) VALUES (?,?,?,?);",@"Jone",[NSNumber numberWithInteger:20],[NSNumber numberWithInteger:0],@"13691315778"];
    
    [ self.db executeUpdateWithFormat:@"insert into PersonList(Name , Age , Sex , Phone) values (%@,%d,%d,%@);",@"wk",20,22,@"13333333333"];
    
    [self.db executeUpdate:@"UPDATE PersonList SET Age = ? WHERE Name = ?",[NSNumber numberWithInteger:30],@"John"];
    
    
    
}

-(void)resultData
{
    //@"SELECT Name, Age, FROM PersonList"
    FMResultSet * rs = [self.db executeQuery:@"SELECT * FROM PersonList"];
    while ([rs next]) {
        NSString * name  = [rs stringForColumn:@"Name"];
        NSInteger age = [rs intForColumn:@"Age"];
        
        NSLog(@"name --- %@ ,age --- %ld",name,(long)age);
    }
    
    [rs close];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
