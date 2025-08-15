//
//  FolderCard.swift
//  AI-Notes
//
//  Created by Suraj-KU on 05/08/25.
//

import SwiftUI

struct FolderCard: View {
    let title: String
    let fileCount: String
    let size: String
    let iconName: String
    let accentColor: Color
    
    var body: some View {
              GeometryReader { geo in
                  ZStack {
                      RoundedRectangle(cornerRadius: 12)
                          .fill(accentColor.opacity(0.2))
                          .padding(.vertical, geo.size.height * 0.08)
                          .frame(width: geo.size.width * 0.65 , height:  geo.size.height * 0.5)
                          .offset(y: -geo.size.height/2 * 0.31)
                          .rotationEffect(.degrees(-12))
                      RoundedRectangle(cornerRadius: 12)
                          .fill(accentColor.opacity(0.3))
                          .padding(.vertical, geo.size.height * 0.08)
                          .frame(width: geo.size.width * 0.7 , height:  geo.size.height * 0.5)
                          .offset(y: -geo.size.height/2 * 0.31)
                      FolderShape()
                          .fill(Color.white)
                          .shadow(color: Color.black.opacity(0.08), radius: 20, x: 0, y: 8)

                      // Overlay positioned relative to container size
                      VStack(alignment: .leading, spacing: geo.size.height * 0.02) {
                          Spacer()

                          ZStack {
                              Circle()
                                  .fill(accentColor.opacity(0.15))
                                  .frame(width: geo.size.width * 0.20,
                                         height: geo.size.width * 0.20)

                              Image(systemName: iconName)
                                  .resizable()
                                  .scaledToFit()
                                  .frame(width: geo.size.width * 0.1,
                                         height: geo.size.width * 0.1)
                                  .foregroundColor(accentColor)
                          }
                          .padding(.top)

                          Text(title)
                              .font(.system(size: geo.size.width * 0.11, weight: .semibold))
                              .foregroundColor(.primary)
                              .lineLimit(1)
//                              .frame(width: geo.size.width * 0.7)

                          Text(fileCount)
                              .font(.system(size: geo.size.width * 0.09))
                              .foregroundColor(.secondary)

                          Text(size)
                              .font(.system(size: geo.size.width * 0.055))
                              .foregroundColor(.secondary)

                          Spacer()
                      }
                      .padding(.vertical, geo.size.height * 0.08)
                      .padding(.trailing, geo.size.height * 0.2)
                  }
              }
              .aspectRatio(1.0, contentMode: .fit)
        
    }
}

#Preview {
    FolderCard(title: "Suraj ]", fileCount: "1223", size: "1.2", iconName: "plus", accentColor: .red)
        
}
