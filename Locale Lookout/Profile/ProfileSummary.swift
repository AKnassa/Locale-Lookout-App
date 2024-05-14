//
//  ProfileSummary.swift
//  Locale Lookout
//
//  Created by Akshit Nassa on 4/26/24.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    
    var body: some View {

        ScrollView{
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                
                Text("Notifications: \(profile.prefersNotifications)")
                Text("Seasonal Photo: \(profile.seasonalPhoto)")
                Text("Goal Date: ") + Text(profile.goalDate, style: .date)
                
                
                Divider()
                
                VStack(alignment: .leading, spacing: 10){
                    
                    Text("Completed Badges")
                        .font(.headline)
                        .bold()
                    
                    HStack{
                        
                        HikeBadge(name: "First Hike")
                        
                        HikeBadge(name: "Earth Day")
                            .hueRotation(/*@START_MENU_TOKEN@*/Angle(degrees: 90)/*@END_MENU_TOKEN@*/)
                        
                        HikeBadge(name: "Tenth Hike")
                            .grayscale(/*@START_MENU_TOKEN@*/0.50/*@END_MENU_TOKEN@*/)
                            .hueRotation(Angle(degrees: 45))
                        }
                    }
                .padding(.bottom)
                
                Divider()
                
                VStack(alignment: .leading){
                    Text("Recent Hikes")
                        .font(.headline)
                        .bold()
                    
                    HikeView(hike: modelData.hikes[0])
                    
                    
                }

                

            }
            .padding()
        }




    }
}

#Preview {
    ProfileSummary(profile: Profile.default)
        .environmentObject(ModelData())
}
