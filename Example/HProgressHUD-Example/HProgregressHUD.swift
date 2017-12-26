import Cocoa

fileprivate let HDefaultPadding: CGFloat = 4.0;
fileprivate let HDefaultLabelFontSize: CGFloat = 16.0;
fileprivate let HDefaultDetailsLabelFontSize: CGFloat = 12.0;


open class HProgregressHUD: NSView {
    
    open static func showHUDAddedTo(view: NSView, animated: Bool) -> HProgregressHUD {
        let hud = HProgregressHUD(with: view)
        view.addSubview(hud)
        hud.showAnimated(animated)
        return hud
    }
    
    open static func hideHUDFor(view: NSView, animated: Bool) -> Bool {
        if let hud = HUDFor(view: view) {
            hud.hideAnimated(animated)
            return true
        } else {
            return false
        }
    }
    
    open static func HUDFor(view: NSView) -> HProgregressHUD? {
        for view in  view.subviews.reversed() {
            if view is HProgregressHUD {
                return view as? HProgregressHUD
            }
        }
        return nil
    }
    
    
    open func showAnimated(_: Bool)  {
        alphaValue = 1.0
        backgroundView.alphaValue = 0.1
    }
    
    open func hideAnimated(_: Bool)  {
        
    }
    
    open func hideAnimated(_: Bool, afterDelay: Double)  {
        
    }
    
    
    open var contentColor: NSColor = NSColor.white
    
    open let backgroundView = HBackgroundView()
    
    open let bezelView = NSVisualEffectView()
    
    
    open let label: NSTextField = createLabel()
    
    open let detailsLabel: NSTextField = createLabel()

    
    
    fileprivate func commonInit() {
        //        _animationType = MBProgressHUDAnimationFade;
        //        _mode = MBProgressHUDModeIndeterminate;
        //        _margin = 20.0f;
        //        _opacity = 1.f;
        //        _defaultMotionEffectsEnabled = YES;
        alphaValue = 0.0
        wantsLayer = true
        layer?.backgroundColor = NSColor.clear.cgColor
        
        setupViews()
        updateIndicators()
    }
    
    public convenience init(with view: NSView) {
        self.init(frame: view.bounds)
    }
    
    public override init(frame frameRect: NSRect) {
        super.init(frame: CGRect())
        commonInit()
    }
    required public init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        commonInit()
    }
    open override var isFlipped: Bool {
        return true
    }
}

extension HProgregressHUD {
    
    fileprivate static func createLabel() -> NSTextField  {
        let label = NSTextField()
        label.isBordered = false
        label.isEditable = false
        label.isSelectable = false
        label.font = NSFont.systemFont(ofSize: 13.5)
        label.drawsBackground = false
        label.alignment = .center
        return label
    }
    

    fileprivate func setupViews() {
        let defaultColor = contentColor
        
        //backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
        backgroundView.autoresizingMask = [.width, .height]
        backgroundView.backgroundColor = NSColor.lightGray
        backgroundView.alphaValue = 0.0
        addSubview(backgroundView)

        bezelView.layer?.cornerRadius = 5.0
        bezelView.state = .active
        bezelView.blendingMode = .withinWindow
        bezelView.alphaValue = 0.8
        
        let materialView = HBackgroundView()
        materialView.autoresizingMask = [.width, .height]
        materialView.backgroundColor = NSColor.black
        materialView.alphaValue = 0.5
        bezelView.addSubview(materialView)
        
        addSubview(bezelView)
        
        label.textColor = defaultColor
        label.font = NSFont.boldSystemFont(ofSize: HDefaultLabelFontSize)
        bezelView.addSubview(label)
        
        detailsLabel.textColor = defaultColor
        detailsLabel.font = NSFont.boldSystemFont(ofSize: HDefaultDetailsLabelFontSize)
        bezelView.addSubview(detailsLabel)
    }
    
    
    fileprivate func updateIndicators() {
        
    }
    
    open override func layout() {
        super.layout()
        
        frame = (superview?.bounds)!
        backgroundView.frame = bounds

        
        label.frame = CGRect(x: 0, y: 10, width: 100, height: 20)
        detailsLabel.frame =  CGRect(x: 0, y: 40, width: 100, height: 20)
        
        
        bezelView.frame = CGRect(x: 0, y: 0, width: 100, height: 80)
        bezelView.makeCenter()
    }
    
    
    

    
    
    
}


fileprivate extension NSView {
    
    fileprivate func makeCenter(in superView: NSView? = nil) {
        var x:CGFloat = 0
        var y:CGFloat = 0
        if let sv = superView {
            x = CGFloat(roundf(Float((sv.frame.width - frame.width)/2.0)))
            y = CGFloat(roundf(Float((sv.frame.height - frame.height)/2.0)))
        } else if let sv = self.superview {
            x = CGFloat(roundf(Float((sv.frame.width - frame.width)/2.0)))
            y = CGFloat(roundf(Float((sv.frame.height - frame.height)/2.0)))
        }
        self.setFrameOrigin(NSMakePoint(x, y))
    }
    
}


open class HBackgroundView: NSView {
    
    public var backgroundColor: NSColor = NSColor.clear {
        didSet {
            if backgroundColor != oldValue {
                layer?.backgroundColor = backgroundColor.cgColor
            }
        }
    }
    
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        wantsLayer = true
    }
    
    required public init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
        wantsLayer = true
    }
    open override var isFlipped: Bool {
        return true
    }
}

