//
//  UIEmojiTextField.swift
//  NotesApp
//
//  Created by Faruk YILDIRIM on 3.01.2022.
//

import UIKit
import SwiftUI

class UIEmojiTextField: UITextField {
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setEmoji() {
        _ = self.textInputMode
    }
    
    override var textInputContextIdentifier: String? {
        return ""
    }
    
    override var textInputMode: UITextInputMode? {
        for mode in UITextInputMode.activeInputModes {
            if mode.primaryLanguage == "emoji" {
                self.keyboardType = .default
                return mode
            }
        }
        
        return nil
    }
}

struct EmojiTextField: UIViewRepresentable{
    @Binding var text: String
    var placeholder: String = ""
    
    func makeUIView(context: Context) -> UIEmojiTextField {
        let txtField = UIEmojiTextField()
        txtField.placeholder = placeholder
        txtField.text = text
        txtField.delegate = context.coordinator as! UITextFieldDelegate
        return txtField
    }
    
    func updateUIView(_ uiView: UIEmojiTextField, context: Context) {
        uiView.text = text
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: EmojiTextField
        
        init(parent: EmojiTextField){
            self.parent = parent
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async { [weak self] in
                self?.parent.text = textField.text ?? ""
            }
        }
    }
}
