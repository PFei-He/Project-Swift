//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//
//  *****  *****
//

#import "___FILEBASENAME___.h"

@interface ___FILEBASENAMEASIDENTIFIER___ ()

///请求接口
@property (strong, nonatomic) <#Request#> *req;

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //初始化网络请求
    [self initRequests:@[self.req?self.req:(self.req=[<#Request#> new])]];
    
    //设置参数并发送请求
    [self params];
    [self.req send];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Datas Management

///参数
- (void)params
{
    
}

@end
