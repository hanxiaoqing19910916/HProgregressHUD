//
//  TrackingView.swift
//  HProgressHUD-Example
//
//  Created by hanxiaoqing on 2018/2/26.
//  Copyright © 2018年 hanxiaoqing. All rights reserved.
//

import Cocoa

class TrackingView: NSView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    var trackingArea : NSTrackingArea?
    override func awakeFromNib() {
        super.awakeFromNib()
        
   
    }
    
    
    override func hitTest(_ point: NSPoint) -> NSView? {
        
        let view = super.hitTest(point)
       
        return view
    }
    
    override func updateTrackingAreas() {
        
        if let trackingArea = trackingArea {
            removeTrackingArea(trackingArea)
        }
        trackingArea = nil
        if let window = window {
            if self ===  window.contentView?.subviews.last {
                let options: NSTrackingArea.Options = [.mouseEnteredAndExited, .activeInKeyWindow, .mouseMoved]
                trackingArea = NSTrackingArea(rect: self.bounds, options: options, owner: self, userInfo: nil)
                addTrackingArea(trackingArea!)
            }
        }
    }
    
    override func mouseEntered(with event: NSEvent) {
        layer?.backgroundColor = NSColor.red.cgColor
    }
    
    override func mouseExited(with event: NSEvent) {
         layer?.backgroundColor = NSColor.purple.cgColor
    }
    
    
    
}
