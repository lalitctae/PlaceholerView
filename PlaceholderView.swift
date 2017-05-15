//
//  PlaceholderView.swift
//
//  Created by Lalit Kumar on 04/04/17.
//  Copyright © 2017 Listup. All rights reserved.
//

import UIKit

extension UIView {
    
    func showPlaceholder(message: String, placeholderImage: UIImage?) {
        self.hidePlaceholder()
        
        let placeholderImageView = UIImageView(frame: CGRect(x: 0, y: self.frame.height / 2 - 160, width: self.frame.width, height: 160))
        placeholderImageView.tag = -1
        placeholderImageView.image = placeholderImage
        placeholderImageView.contentMode = UIViewContentMode.ScaleAspectFit
        self.addSubview(placeholderImageView)
        
        let messageLabel = UILabel(frame: CGRect(x: 16, y: self.frame.height / 2, width: self.frame.width - 32, height: 40))
        messageLabel.tag = -1
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .Center
        messageLabel.textColor = UIColor.lightGrayColor()
        messageLabel.font = UIFont.systemFontOfSize(17.0)
        messageLabel.setContentHuggingPriority(1000, forAxis: .Vertical)
        self.addSubview(messageLabel)
    }
    
    func showPlaceholder(message: String, showIndicator: Bool = false) {
        self.hidePlaceholder()
        
        let messageLabel = UILabel(frame: CGRect(x: 16, y: self.frame.height/2 - 20, width: self.frame.width - 32, height: 100))
        messageLabel.tag = -1
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .Center
        messageLabel.textColor = UIColor.lightGrayColor()
        messageLabel.font = UIFont.systemFontOfSize(17.0)
        messageLabel.setContentHuggingPriority(800, forAxis: .Vertical)
        self.addSubview(messageLabel)
        
        if showIndicator {
            let activityIndicator = UIActivityIndicatorView()
            activityIndicator.tag = -1
            activityIndicator.center = CGPointMake(self.frame.width / 2, self.frame.height / 2 - 60)
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
            self.addSubview(activityIndicator)
            activityIndicator.startAnimating()
        }
    }
    
    func hidePlaceholder() {
        for subview in self.subviews {
            if let indicator = subview as? UIActivityIndicatorView {
                indicator.stopAnimating() 
            }
            if subview.tag == -1 {
                subview.removeFromSuperview()
            }
        }
    }
}