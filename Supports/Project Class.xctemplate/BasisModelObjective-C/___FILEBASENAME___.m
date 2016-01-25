//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//
//  ***** 接口 *****
//

#import "___FILEBASENAME___.h"

@implementation <#Result#>

@end

@implementation ___FILEBASENAMEASIDENTIFIER___

@end

@implementation <#Request#>

//发送请求
- (void)send
{
    [self requestWillStart];
    @weakify_self
    [self sendWithAPI:<#(NSString *)#> results:^(id JSON) {
        @strongify_self
        if (JSON) {
            [self requestSuccessWithObject:<#result#>];
            [self requestWasEnded];
        } else {
            [self requestFailedWithObject:<#result#>];
            [self requestWasEnded];
        }
    }];
}

@end
