//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//
//   __________   __________    _________   ___________  ___________   __________  ___________
//  |  _______ \ |  _______ \  / _______ \ |______   __||  _________| / _________||____   ____|
//  | |       \ || |       \ || /       \ |       | |   | |          | /               | |
//  | |_______/ || |_______/ || |       | |       | |   | |_________ | |               | |
//  |  ________/ |  _____  _/ | |       | | _     | |   |  _________|| |               | |
//  | |          | |     \ \  | |       | || |    | |   | |          | |               | |
//  | |          | |      \ \ | \_______/ || \____/ |   | |_________ | \_________      | |
//  |_|          |_|       \_\ \_________/  \______/    |___________| \__________|     |_|
//
//
//  The framework design by https://github.com/PFei-He/Project-ObjC
//
//  ***** 数据模型接口 *****
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
    @weakify_self
    [self send:^(id JSON) {
        @strongify_self
        if (JSON) {
            [self finishedWithSuccessObject:<#result#>];
        } else {
            [self finishedWithFailureObject:<#result#>];
        }
    }];
}

@end
