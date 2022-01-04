//
//  AnimationUtil.swift
//  NotesApp
//
//  Created by Faruk YILDIRIM on 4.01.2022.
//

import SwiftUI

extension Animation {
    func `repeat`(while expression: Bool, autoreverses: Bool = true) -> Animation {
        if expression {
            return self.repeatForever(autoreverses: autoreverses)
        } else {
            return self
        }
    }
}
