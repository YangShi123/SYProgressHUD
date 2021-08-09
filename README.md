# SYProgressHUD

[![CI Status](https://img.shields.io/travis/shiyawn@163.com/SYProgressHUD.svg?style=flat)](https://travis-ci.org/shiyawn@163.com/SYProgressHUD)
[![Version](https://img.shields.io/cocoapods/v/SYProgressHUD.svg?style=flat)](https://cocoapods.org/pods/SYProgressHUD)
[![License](https://img.shields.io/cocoapods/l/SYProgressHUD.svg?style=flat)](https://cocoapods.org/pods/SYProgressHUD)
[![Platform](https://img.shields.io/cocoapods/p/SYProgressHUD.svg?style=flat)](https://cocoapods.org/pods/SYProgressHUD)

## Example

HUD.showIndicator("这是一个菊花弹窗", view: nil){ //TODO 弹窗结束闭包 }

HUD.showMsg("这是一个纯文字弹窗", view: nil){ //TODO 弹窗结束闭包 }

HUD.showSuccess("这是一个成功弹窗", view: nil){ //TODO 弹窗结束闭包 }

HUD.showFailed("这是一个失败弹窗", view: nil){ //TODO 弹窗结束闭包 }

HUD.showProgress("设置一个进度弹窗", progress: progress, view: nil){ //TODO 弹窗结束闭包 }

## Installation

SYProgressHUD is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SYProgressHUD'
```

## Author

石头羊子, 421111472@qq.com
