![logo](https://github.com/PFei-He/PFSwift/blob/master/PFSwift.png)
[PFSwift](https://github.com/PFei-He/PFSwift)
===

[![License MIT](https://img.shields.io/badge/license-MIT-green.svg)](https://raw.githubusercontent.com/PFei-He/PFSwift/master/LICENSE)
[![Support](https://img.shields.io/badge/support-iOS%208%2B%20-blue.svg?style=flat)](https://www.apple.com/nl/ios/)
[![Cocoapods Compatible](https://img.shields.io/cocoapods/v/PFSwift.svg)](https://img.shields.io/cocoapods/v/PFSwift.svg)

对系统API进行简单封装，实现常用功能

版本
---
0.4.0

说明
---
#### Extension
* `PFDate`          - NSDate扩展
* `PFDictionary`    - Dictionary扩展
* `PFString`        - String扩展
* `PFTimer`         - NSTimer扩展
* `PFView`          - UIView扩展

#### Framework
* `PFFile`          - 实现文件生成和读写功能
* `PFModel`         - 数据模型基类
* `PFQRCode`        - 利用AVFoundation框架生成二维码
* `PFScanner`       - 扫描器
* `PFTime`          - 实现时间获取和转换功能

安装
---
#### 手动安装
```
将`PFSwift`文件夹拖入到工程目录中即可使用
```

#### CocoaPods
```
platform:ios, '8.0'
use_frameworks!
pod 'PFSwift', '~> 0.4'
```
###### 注意
由于CocoaPods对Swift的最低支持版本为iOS8.0，如要兼容iOS7.0+，只能手动拖入到工程中使用

使用
---
#### CocoaPods
```
import PFSwift
```
 
许可证
---
`PFSwift`使用 MIT 许可证，详情见 [LICENSE](https://raw.githubusercontent.com/PFei-He/PFSwift/master/LICENSE) 文件。
