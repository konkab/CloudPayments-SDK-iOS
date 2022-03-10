//
//  BaseViewController.swift
//  sdk
//
//  Created by Sergey Iskhakov on 21.09.2020.
//  Copyright © 2020 Cloudpayments. All rights reserved.
//

import Foundation
import UIKit

public class BaseViewController: UIViewController {
    var isKeyboardShowing: Bool = false
    var keyboardFrame: CGRect = .zero
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardWillShow(_:)), name: UITextField.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardWillHide(_:)), name: UITextField.keyboardWillHideNotification, object: nil)
        
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }
    
    @objc internal func onKeyboardWillShow(_ notification: Notification) {
        self.isKeyboardShowing = true
        self.keyboardFrame = (notification.userInfo?[UITextField.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? .zero
    }
    
    @objc internal func onKeyboardWillHide(_ notification: Notification) {
        self.isKeyboardShowing = false
        self.keyboardFrame = .zero
    }
}
