//
//  WebViewViewController.m
//  MJRefresh
//
//  Created by 王凯 on 15/12/28.
//  Copyright © 2015年 王凯. All rights reserved.
//

#import "WebViewViewController.h"


@interface WebViewViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView*webView;

@end

@implementation WebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 20, kWidth, kHeight-20)];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://github.com"]]];
    
    __unsafe_unretained UIWebView*webView = self.webView;
    __unsafe_unretained UIScrollView * scrollView = self.webView.scrollView;
    
    scrollView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [webView reload];
    }];
    
    
    // Do any additional setup after loading the view.
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.webView.scrollView.mj_header endRefreshing];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    [self setNeedsStatusBarAppearanceUpdate];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
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
