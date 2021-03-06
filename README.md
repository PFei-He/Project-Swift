![logo](https://github.com/PFei-He/Project-Swift/blob/master/Project.png)
[Project](https://github.com/PFei-He/Project-Swift)
===

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg)](https://raw.githubusercontent.com/PFei-He/Project-Swift/master/LICENSE)
[![Support](https://img.shields.io/badge/support-iOS%208%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)

快速开发集成框架

版本
---
0.1.0

说明
---
#### 关于项目
本项目既是一个iOS开发的示例工程，也是一个可用于快速开发的集成框架，为iOS初学者、工程管理能力较弱以及需要进行快速工程搭建的开发者提供一个基础的框架。<br>
本项目已嵌入了以下能力：
* CocoaPods
* 网络请求
* KVC解析JSON
* XML转化JSON
* 二维码生成和扫描
* 文件管理

#### 目录解释
`Project`使用`MVVM`架构搭建，共分为2个目录，3个部分。

* Pods - CocoaPods目录，集合了工程使用的所有第三方类库，用于作为工程底层的支持。
* Project - 工程目录，项目开发的目录。开发者在本层进行开发工作。
    * Project - 包含有App开发的代码，资源，配置文件等。
    * Base Framework - 基础框架目录，提供工程使用的基础父类，提供快速开发的基本能力。

#### 关于Objective-C
`Project`提供了`Objective-C`版本以便使用。[点我跳转](https://github.com/PFei-He/Project-ObjC)至`Project-ObjC`

示例代码
---
声明：示例使用的是`中国天气网`提供的开放接口，如有侵权，请告知！

#### API
```swift
{
    "api":["101010100.html", //北京天气接口
           "101020100.html", //上海天气接口
           "101280101.html"] //广州天气接口
}
```

#### Model
```swift
/**
 发送请求
 - Note: 无
 - Parameter 无
 - Returns: 无
 */
func send() {
    send { [unowned self] (JSON) -> Void in
        if JSON != nil {
            let model = WeatherModel(JSON: JSON!)
            let result = WeatherResult(JSON: model.weatherinfo)
            self.finished(successResult: result)
        } else {
            self.finished(failureResult: "请求失败")
        }
    }
}
```

#### ViewModel
```swift
//添加网络请求
addRequests([req])
```

```swift
//请求成功
override func requestSuccess() {
    let result = successObject as! WeatherResult
    cityLabel.text = result.city
    temperatureLabel.text = String(result.temp)+"℃"
}
```

#### 更多
更多功能请[下载](https://github.com/PFei-He/Project-Swift/archive/master.zip)查看DEMO

文件模板使用（Xcode 7+）
---
请将下载到的`Project Class.xctemplate`放置于`~/Library/Developer/Xcode/Templates/File Templates/Source/`文件夹下，如过程中没有此些文件夹，请自行创建。

![Screenshot](https://github.com/PFei-He/Project-Swift/blob/master/Supports/Screenshot.png)

模板中带有以下的类，请开发者自行选择继承
* BaseModel - 基础数据模型
* BaseRequest - 基础请求处理
* BaseCollectionViewController - 基础图表视图控制器
* BaseTableViewController - 基础列表视图控制器
* BaseViewController - 基础视图控制器

开源声明
---
#### 本类库使用了以下类库
* [Alamofire](https://github.com/Alamofire/Alamofire)
* [PFKitSwift](https://github.com/PFei-He/PFKitSwift)
* [SVProgressHUD](https://github.com/SVProgressHUD/SVProgressHUD)

许可证
---
`Project`使用 MIT 许可证，详情见 [LICENSE](https://raw.githubusercontent.com/PFei-He/Project-Swift/master/LICENSE) 文件。
