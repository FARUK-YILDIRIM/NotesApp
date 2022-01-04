//
//  NavigationBarUtil.swift
//  NotesApp
//
//  Created by Faruk YILDIRIM on 4.01.2022.
//

import SwiftUI
import UIKit

class Theme {
    static func navigationBarColors(background: Color?, titleColor: Color? = nil, tintColor: Color? = nil){
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithOpaqueBackground()
        navigationAppearance.backgroundColor = UIColor(background ?? Color.clear)
        
        navigationAppearance.titleTextAttributes = [.foregroundColor: UIColor(titleColor ?? .black)]
        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(titleColor ?? .black)]
        
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().compactAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
        
        UINavigationBar.appearance().tintColor = UIColor(titleColor ?? .black)
    } 
}
