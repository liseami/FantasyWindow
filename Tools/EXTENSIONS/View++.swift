//
//  ViewEx.swift
//  SuperBody
//
//  Created by 赵翔宇 on 2022/2/4.
//

import SwiftUI


extension View{
    func isPreviewView() -> some View{
        return self.modifier(isPreview_ViewModifier())
    }
}

struct isPreview_ViewModifier : ViewModifier{
    func body(content: Content) -> some View {
        return
         
            NavigationView {
                ZStack{
                    Color.back1.ignoresSafeArea()
                    content
                }
            }
            .preferredColorScheme(.dark)
        
    }
}

