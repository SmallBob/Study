//
//  ViewController.m
//  MJRefresh
//
//  Created by 王凯 on 15/12/28.
//  Copyright © 2015年 王凯. All rights reserved.
//

#import "ViewController.h"
#import <MJRefresh.h>



@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView*tableView;
@property(nonatomic,strong)NSMutableArray*dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationController.navigationBarHidden = YES;
    if (!_dataArray) {
        _dataArray = [NSMutableArray array ];
        for (int i = 0; i < 10; i++) {
            [_dataArray addObject:[NSString stringWithFormat:@"10--%d",i]];
        }
    }
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 22, kWidth, kHeight-22) style:UITableViewStylePlain];
    self.tableView.delegate  = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    [self.view addSubview:self.tableView];
    
    
    
    
    __unsafe_unretained UITableView*tableView = self.tableView;
    
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefresh)];
    
    
    MJRefreshNormalHeader * header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    //设置文字
    [header setTitle:@"Pull down to refresh " forState:MJRefreshStateIdle];
    [header setTitle:@"Release to refresh " forState:MJRefreshStatePulling];
    [header setTitle:@"Loading ..." forState:MJRefreshStateRefreshing];
    
    //tableView.mj_header = header;
    
    
    tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRefresh)];
    
    
    MJRefreshAutoNormalFooter * footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    //设置文字
    [footer setTitle:@"Click or drag to refresh " forState:MJRefreshStateIdle];
    [footer setTitle:@"No more data " forState:MJRefreshStateNoMoreData];
    [footer setTitle:@"Loading More..." forState:MJRefreshStateRefreshing];
 
    //footer.automaticallyChangeAlpha = YES;
    
    tableView.mj_footer = footer;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)loadNewData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    });

}

-(void)loadMoreData
{
    
    
    for (int i = 0 ; i<5; i++) {
        [self.dataArray addObject:[NSString stringWithFormat:@"下啦刷新--%d",i]];
    }

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
    });
}

-(void)headerRefresh
{
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        _dataArray = [NSMutableArray array ];
        for (int i = 0; i < 10; i++) {
            [_dataArray addObject:[NSString stringWithFormat:@"20--%d",i]];
        }
        
        [self.tableView reloadData];
        
        [self.tableView.mj_header endRefreshing];
        
    });
}

-(void)footerRefresh
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (int i = 30; i < 35; i++) {
            [_dataArray addObject:[NSString stringWithFormat:@"30--%d",i]];
        }
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
    });

}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*cellID = @"cellID";
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.row];
    
    
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
