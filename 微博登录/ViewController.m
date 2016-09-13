//
//  ViewController.m
//  微博登录
//
//  Created by zjwang on 16/6/15.
//  Copyright © 2016年 夏天. All rights reserved.
//

#import "ViewController.h"
#import <WeiboSDK.h>

#define kRedirectURI    @"http://www.sina.com"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /**
     *  App Key：2727693364
     *  App Secret：eb4f99c1fa8338652de66dcd8cadc131
     *
     */
    // 2.00yOHsNEQeHbyCf77aa0dff9YjuV4C
    // WeiBo_接口
    // https://api.weibo.com/2/statuses/public_timeline.json?access_token=2.00yOHsNEQeHbyCf77aa0dff9YjuV4C&count=10&page=1&base_app=0
    UIButton *btnWB_Login = [UIButton buttonWithType:UIButtonTypeCustom];
    btnWB_Login.frame = CGRectMake(50, 50, 200, 50);
    btnWB_Login.backgroundColor = [UIColor blueColor];
    [btnWB_Login setTitle:@"Weibo Login" forState:UIControlStateNormal];
    [self.view addSubview:btnWB_Login];
    [btnWB_Login addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (void)loginClick
{
    WBAuthorizeRequest *request = [WBAuthorizeRequest request];
    request.redirectURI = kRedirectURI;
    request.scope = @"all";
    request.userInfo = @{@"SSO_From": @"SendMessageToWeiboViewController",
                         @"Other_Info_1": [NSNumber numberWithInt:123],
                         @"Other_Info_2": @[@"obj1", @"obj2"],
                         @"Other_Info_3": @{@"key1": @"obj1", @"key2": @"obj2"}};
    [WeiboSDK sendRequest:request];
}


- (void)WBLogin:(NSNotification *)notifi
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
