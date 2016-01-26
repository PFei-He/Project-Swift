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
//  The template design by https://github.com/PFei-He/Project-Swift
//
//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//
//  ***** 列表视图控制器 *****
//

import Builds

class ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_cocoaTouchSubclass___  {

    ///请求接口
    private let req = <#Request#>()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //初始化网络请求
        initRequests([req])
        
        //设置参数并发送请求
        params()
        req.send()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Datas Management
    
    ///参数
    private func params() {
        
    }

    // MARK: - UITableViewDataSource Methods

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("identifier", forIndexPath: indexPath)
        return cell
    }
    
    // MARK: - UITableViewDelegate Methods
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
}
