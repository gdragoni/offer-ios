//
//  TransparentNavigationBar.swift
//  Offer
//
//  Created by Gabriel A. Dragoni on 28/12/20.
//

import UIKit

class TransparentNavigationBar: UINavigationBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setup() {
        let image = UIImage()
        self.setBackgroundImage(image, for: .default)
        self.shadowImage = image
        self.topItem?.title = ""
        self.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)]
    }
}
