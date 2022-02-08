//
//  UIState.swift
//  SuperBody
//
//  Created by 赵翔宇 on 2022/2/4.
//

import SwiftUI

class UIState : ObservableObject {
    
    static let share = UIState()
    
    @Published var tabbarTarget : TabbarEnum = .home
    var tabbarItems : [TabbarEnum] = [.home,.friends]
    
    enum TabbarEnum{
        case home,friends
        
        var index : Int{
            switch self {
            case .home:
                return 1
            case .friends:
                return 2
            }
        }
        
        var title : String{
            switch self {
            case .home:
                return "首页"
            case .friends:
                return "朋友"
            }
        }
    
    }
}
