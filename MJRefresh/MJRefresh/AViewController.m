//
//  AViewController.m
//  MJRefresh
//
//  Created by 王凯 on 15/12/28.
//  Copyright © 2015年 王凯. All rights reserved.
//

#import "AViewController.h"




@interface AViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,strong)UICollectionView*collection;
@property(nonatomic,strong)NSMutableArray*colors;
@end

@implementation AViewController

-(NSMutableArray *)colors
{
    if (!_colors) {
        _colors = [NSMutableArray array ];
        for (int i = 0 ; i< 10; i++) {
            [_colors insertObject:MJRandomColor atIndex:0];
        }
    }
    return _colors;
}

- (IBAction)backClick:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

static NSString * const MJCollectionViewCellIdentifier = @"color";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(80, 80);
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    layout.minimumInteritemSpacing =20;
    layout.minimumLineSpacing = 20;
    
    
    self.collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 20, kWidth, kHeight-20) collectionViewLayout:layout];
    self.collection.dataSource = self;
    self.collection.delegate = self;
    [self.view addSubview:self.collection];
    
    self.collection.backgroundColor = [UIColor whiteColor];
    [self.collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:MJCollectionViewCellIdentifier];
    
    
    __unsafe_unretained __typeof(self)  weakSelf = self;
    self.collection.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        for (int i = 0; i < 5; i++) {
            [weakSelf.colors insertObject:MJRandomColor atIndex:0];
            
        }
        
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.collection reloadData];
            
            [weakSelf.collection.mj_header endRefreshing];
        });
        
    }];
    //[self.collection.mj_header beginRefreshing];
    
    
    self.collection.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        for (int i = 0 ; i<5; i++) {
            [weakSelf.colors addObject:MJRandomColor];
            
        }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf.collection reloadData];
            [weakSelf.collection.mj_footer endRefreshing];
        });
    }];
    [self.collection.mj_footer setHidden:YES];
    
    // Do any additional setup after loading the view.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    self.collection.mj_footer.hidden = self.colors.count == 0;
    return self.colors.count;
}



-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:MJCollectionViewCellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = self.colors[indexPath.row];
    
    return cell;
    
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
