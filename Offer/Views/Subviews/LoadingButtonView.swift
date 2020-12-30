//
//  LoadingButtonView.swift
//  Offer
//
//  Created by Gabriel Dragoni on 30/12/20.
//

import UIKit

class LoadingButtonView: UIView {
    @IBOutlet var txtLabelView: UIView!
    @IBOutlet var loadingView: UIActivityIndicatorView!
    
    func showLoading() {
        DispatchQueue.main.async { [weak self] in
            self?.txtLabelView.isHidden = true
            self?.loadingView.startAnimating()
        }
    }
    
    func hiddenLoading() {
        DispatchQueue.main.async { [weak self] in
            self?.txtLabelView.isHidden = false
            self?.loadingView.stopAnimating()
        }
    }
}
