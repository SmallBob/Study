//
//  ViewController.m
//  js
//
//  Created by 王凯 on 15/12/23.
//  Copyright © 2015年 wk. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()<UIWebViewDelegate>
{
    UIWebView*myWebView;
}
@end

@implementation ViewController


//http://blog.csdn.net/lwjok2007/article/details/47058795

- (void)viewDidLoad {
    [super viewDidLoad];
    myWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 22, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-22)];
    myWebView.delegate = self;
    [self.view addSubview:myWebView];
    
    
    NSString*httpStr = @"https://www.baidu.com";
    NSURL * url = [NSURL URLWithString:httpStr];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [myWebView loadRequest:request];
    
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark webViewDelegate
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //网页加载失败 调用此方法
    NSLog(@"网页加载失败 调用此方法");
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    //网页加载之前会调用此方法
    
    //retrun YES 表示正常加载网页 返回NO 将停止网页加载
    return YES;
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    //开始加载网页调用此方法
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //网页加载完成调用此方法
    JSContext * context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    NSString*alertJS = @"alert('test js oc')";
    
    //[context evaluateScript:alertJS];
    
    
    context[@"test1"] = ^(){
        NSArray*ary = [JSContext currentArguments];
        for (id obj in ary) {
            NSLog(@"%@",obj);
        }
        
    
    };
    
    NSString*jsFunctStr1 = @"test1('canshu1')";
    [context evaluateScript:jsFunctStr1];
    
    NSString *jsFunctStr2=@"test1('参数a','参数b')";
    [context evaluateScript:jsFunctStr2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
