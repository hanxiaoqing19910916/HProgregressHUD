//
//  ViewController.swift
//  HProgressHUD-Example
//
//  Created by hanxiaoqing on 2017/12/25.
//  Copyright © 2017年 hanxiaoqing. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    override func mouseDown(with event: NSEvent) {
        _ = view.subviews.map({
            if $0 is HProgregressHUD {
                $0.removeFromSuperview()
            }
        })
        let hud = HProgregressHUD.showHUDAddedTo(view:(NSApp.keyWindow?.contentView)!, animated: true)
        hud.label.stringValue = "HUD loading title"
//        hud.detailsLabel.stringValue = "这会是一个很长的文字, 虽然也不知道说什么，但是请记住，这是一段很长的文字这会是一个很长的文字, 虽然也不知道说什么，但是请记住，这是一段很长的文字这会是一个很长的文字, 虽然也不知道说什么，但是请记住，这是一段很长的文字这会是一个很长的文字, 虽然也不知道说什么，但是请记住，这是一段很长的文字这会是一个很长的文字"
    }
}

