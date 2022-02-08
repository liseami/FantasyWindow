//
//  ContentView.swift
//  FantasyWindow
//
//  Created by 赵翔宇 on 2022/2/8.
//

import SwiftUI
import CoreData
import FantasyUI

struct ContentView: View {
    
    @ObservedObject var ui = UIState.share
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    @State private var showProfileView : Bool = false
    @State private var showNotifiView : Bool = false
    @State private var showSearchView : Bool = false
    @State private var showPhotosView : Bool = false
    
    
    var body: some View {
        
        NavigationView {
            
            
            main_views
            .navigationBarTitleDisplayMode(.large)
            .toolbar {navi_leading;navi_trainling}
            .PF_Navilink(isPresented: $showNotifiView) {
                NotifiView()
            }
            .PF_Navilink(isPresented: $showSearchView) {
                SearchView()
            }
            .PF_Navilink(isPresented: $showProfileView) {
                ProfileView()
            }
            .PF_SystemSheet(isPresented: $showPhotosView) {
                
            } content: {
                PhotosView()
            }

            
        }
        .navigationViewStyle(.stack)
        .preferredColorScheme(.dark)
        
    }
    
    var main_views : some View {
        ZStack{
            Color.BackGround.ignoresSafeArea()
            
            let isOnHomeView = ui.tabbarTarget == .home
            HStack{
                Group{
                    //-------------
                    // 首页
                    home_view
                    //-------------
                    // 朋友
                    friends_view
                }
                .offset(x: isOnHomeView ? SW / 2 : -SW / 3.8)
            }
            .frame(width: SW)
            
            Tabbar()
        }
    }
    
    
    var home_view : some View {
        VStack(spacing:48){
            RoundedRectangle(cornerRadius: 32, style: .continuous)
                .fill(Color.gray)
                .frame( height: SW - 48)
                .padding(.horizontal,24)
            
            tools
            
            Spacer()
        }
        .frame(width: SW)
        
    }
    
    var friends_view : some View {
        
        List{
            HStack(spacing:12){
                Spacer()
                ICON(name: "person-add",fcolor: .fc1,size: 24)
                Text("添加朋友")
                    .mFont(style: .Title_17_B,color: .fc1)
                Spacer()
            }
            .refreshable {
                
            }
            .padding(.vertical,8)
            .overlay(Capsule(style: .continuous)
                        .stroke(lineWidth: 0.5)
                        .foregroundColor(.fc2))
            .listRowInsets(.init(top: 8, leading: 16, bottom: 8, trailing: SW / 2 - SW / 3.8 + 16))
            .listRowBackground(Color.clear)
           
            ForEach(0..<12){index in
                userline
                    .listRowInsets(.init(top: 8, leading: 0, bottom: 8, trailing: SW / 2 - SW / 3.8 + 16))
                    .listRowBackground(Color.clear)
            }
        }
        .frame(width: SW)
    }
    
    var userline : some View {
        HStack{
            Circle().fill(Color.random)
                .frame(width: 56)
            VStack(alignment: .leading, spacing: 4){
                Text("Joshua Lawrence")
                    .mFont(style: .Title_17_B,color: .fc1)
                    .PF_Leading()
                Text("更新了个人贴纸")
                    .mFont(style: .Body_15_R,color: .accentColor)
            }
        }
    }
    
    var navi_leading : some ToolbarContent{
        ToolbarItem(placement: .navigationBarLeading) {
            ICON(name: "search",fcolor: .fc1,size: 24){
                showSearchView.toggle()
            }
        }
    }
    var navi_trainling : some ToolbarContent{
        ToolbarItem(placement: .navigationBarTrailing) {
            HStack(spacing:20){
                ICON(name: "notifi",fcolor: .fc1,size: 24){
                    showNotifiView.toggle()
                }
                Button {
                    showProfileView.toggle()
                } label: {
                    
                    Circle().fill(Color.random)
                        .frame(width: 32, height: 32)
                }

            }
            
        }
    }
    var tools : some View {
        VStack(spacing:24){
            HStack{
                Spacer()
                ICON(name: "pic",fcolor: .fc1,size: 32){
                    showPhotosView.toggle()
                }
                Spacer()
                Circle()
                    .fill(Color.fc1)
                    .frame(width: 56, height: 56)
                    .padding(.all,4)
                    .overlay(Circle().stroke(lineWidth: 3).foregroundColor(.accentColor))
                Spacer()
                ICON(name: "revoke",fcolor: .fc1,size: 32)
                Spacer()
            }
            Text("Tips:你的操作将在朋友的手机桌面同步更新。")
                .mFont(style: .Body_13_R,color: .fc3)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
