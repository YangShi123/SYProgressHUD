//
//  SYProgressHUD.swift
//
//  基于MBProgressHUD的二次封装

import Foundation
import MBProgressHUD

public let HUD = SYProgressHUD.shared

public class SYProgressHUD {
    /// 单例
    public static let shared = SYProgressHUD()
    
    private var hud: MBProgressHUD?
    
    /// hud展示时间
    private var afterDelay: TimeInterval = 2
    
    /// hud背景颜色 默认黑色
    private var backgroundColor: UIColor = .black
    
    /// 配置hud属性
    public func config(afterDelay: TimeInterval? = nil,
                       backgroundColor: UIColor? = nil) {
        if afterDelay != nil { self.afterDelay = afterDelay! }
        if backgroundColor != nil { self.backgroundColor = backgroundColor! }
    }
    
    private func show(_ msg: String,
                      mode: MBProgressHUDMode? = .text,
                      view: UIView?,
                      image: UIImage? = nil,
                      progress: Float = 0,
                      autoHidden: Bool = true,
                      completion: (() -> Void)? = nil) {
        if hud != nil && mode != MBProgressHUDMode.annularDeterminate {
            hud?.removeFromSuperview()
            hud = nil
        }
        if hud == nil {
            hud = MBProgressHUD.showAdded(to: view ?? UIApplication.shared.windows.last!,
                                          animated: true)
        }
        hud?.label.numberOfLines = 0
        hud?.contentColor = .white
        hud?.bezelView.style = .solidColor
        hud?.bezelView.color = self.backgroundColor
        hud?.animationType = .zoom
        hud?.margin = 15
        hud?.removeFromSuperViewOnHide = true
        hud?.minSize = CGSize(width: 80, height: 50)
        hud?.label.text = msg
        hud?.mode = mode!
        if mode == .annularDeterminate { hud?.progress = progress }
        if let image = image { hud?.customView = UIImageView(image: image) }
        if autoHidden { hud?.hide(animated: true, afterDelay: self.afterDelay) }
        if completion != nil {
            DispatchQueue.main.asyncAfter(deadline: .now() + self.afterDelay) {
                completion!()
            }
        }
    }
    
    private func hide() {
        hud?.hide(animated: true)
    }
}

extension SYProgressHUD {
    /// 文字hud
    public func showMsg(_ msg: String,
                        view: UIView? = nil,
                        completion: (() -> Void)? = nil) {
        show(msg, view: view)
    }
    
    /// 菊花hud
    public func showIndicator(_ msg: String,
                              view: UIView? = nil,
                              completion: (() -> Void)? = nil) {
        show(msg, mode: .indeterminate, view: view, autoHidden: false, completion: completion)
    }
    
    /// 成功hud
    public func showSuccess(_ msg: String,
                            view: UIView? = nil,
                            completion: (() -> Void)? = nil) {
        let path = Bundle(for: SYProgressHUD.self).path(forResource: "SYProgressHUD", ofType: "bundle")
        let bundle = Bundle(path: path!)
        let file = bundle?.path(forResource: "success@2x", ofType: "png")
        let image = UIImage(contentsOfFile: file!)?.withRenderingMode(.alwaysOriginal)
        show(msg, mode: .customView ,view: view, image: image, completion: completion)
    }
    
    /// 失败hud
    public func showFailed(_ msg: String,
                           view: UIView? = nil,
                           completion: (() -> Void)? = nil) {
        let path = Bundle(for: SYProgressHUD.self).path(forResource: "SYProgressHUD", ofType: "bundle")
        let bundle = Bundle(path: path!)
        let file = bundle?.path(forResource: "fail@2x", ofType: "png")
        let image = UIImage(contentsOfFile: file!)?.withRenderingMode(.alwaysOriginal)
        show(msg, mode: .customView ,view: view, image: image, completion: completion)
    }
    
    /// 进度hud
    public func showProgress(_ msg: String,
                             progress: Float,
                             view: UIView? = nil,
                             completion: (() -> Void)? = nil) {
        show(msg, mode: .annularDeterminate, view: view, progress: progress, autoHidden: false, completion: completion)
    }
    
    /// 隐藏hud
    public func hidden() {
        hide()
    }
}

