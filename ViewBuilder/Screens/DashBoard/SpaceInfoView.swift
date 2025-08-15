//
//  SpaceInfoView.swift
//  AI-Notes
//
//  Created by Suraj-KU on 04/08/25.
//

import SwiftUI

struct SpaceInfoView: View {
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            
            RoundedRectangle(cornerRadius: 23, style: .circular)
                .fill(Color.secondryBackGround)
                .frame(maxWidth: .infinity)
                .frame(height: 120)
                .padding(14)
                .background{
                    ZStack{
                        RoundedRectangle(cornerRadius: 23, style: .circular)
                            .fill(Color.turnaryryBackGround.opacity(0.5))
                            .clipped()
                            .frame(width: width * 0.7, height: 120)
                            .offset(y : 20)
                        RoundedRectangle(cornerRadius: 23, style: .circular)
                            .fill(Color.turnaryryBackGround)
                            .clipped()
                            .frame(width: width * 0.8, height: 120)
                            .offset(y : 10)
                       
                    }
                  
                        
                }
                .overlay {
                    HStack(spacing : 20){
                        Image(systemName: "chart.pie.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundStyle(Color.secondryBackGround)
                            .frame(width: 50 , height: 50)
                            .glassEffect()
                            .background{
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(Color.turnaryryBackGround)
                                    .frame(width: 70 , height: 70)
//                                    .glassEffect()
                                
                            }
                        VStack(alignment : .leading){
                            Text("Available Space")
                            Text("20.54 GB of 25 GB Used")
                        }
                    }
                }
        }
        .frame(height: 170)
     
    }
}


#Preview {
    SpaceInfoView()
}
