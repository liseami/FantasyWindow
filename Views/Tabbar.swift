//
//  Tabbar.swift
//  FantasyWindow
//
//  Created by 赵翔宇 on 2022/2/8.
//

import SwiftUI

struct Tabbar: View {
    @ObservedObject var ui = UIState.share
    @Namespace var tabbaranimation
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [Color.BackGround,
                                                   Color.BackGround,Color.BackGround.opacity(0)]), startPoint: .bottom, endPoint: .top)
            .ignoresSafeArea()
            .frame( height: GoldenH * 2.7)
            .overlay( HStack{
                ForEach(ui.tabbarItems,id:\.self.title){tabitem in
                    Spacer()
                        .frame( height: GoldenH)
                        .overlay(
                            VStack(spacing:2){
                                Text(tabitem.title)
                                    .mFont(style: .LargeTitle_22_B,color:.fc1)
                                Capsule(style: .continuous)
                                    .fill(Color.accentColor)
                                    .frame(width: 32, height: 4.7)
                                    .matchedGeometryEffect(id: "tabbaritem", in: tabbaranimation)
                                    .ifshow(tabitem == ui.tabbarTarget, animation: .spring())
                                Spacer()
                            }
                        )
                        .onTapGesture {
                            withAnimation(.spring()){
                                ui.tabbarTarget = tabitem
                            }
                        }
                }
            }
                        .padding(.horizontal,SW * 0.1),alignment: .bottom)
            .MoveTo(.bottomCenter)
        
    
    }
}

struct Tabbar_Previews: PreviewProvider {
    static var previews: some View {
        Tabbar()
            .isPreviewView()
    }
}
