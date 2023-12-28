//
//  ProgressionView.swift
//  ProgressComponent
//
//  Created by Debartha Chakraborty on 29/10/23.
//

import SwiftUI

struct ProgressionView: View {
    
    var percent: CGFloat = 0
    
    var body: some View {
        GeometryReader { geo in
            Capsule()
                .foregroundColor(.black)
                .overlay(alignment: .leading) {
                    VStack(spacing: 0) {
                        Color.yellow
                        Color.orange
                    }
                    .cornerRadius(geo.size.height / 2)
                    .frame(width: max(percent * geo.size.width, geo.size.height))
                    .offset(x: min(0, percent * geo.size.width - geo.size.height))
                    .clipShape(RoundedCorner(radius: geo.size.height / 2))
                }
        }
    }
}

struct ProgressionView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProgressionView(percent: 0.05)
            .frame(width: 300, height: 30)
            .previewLayout(.sizeThatFits)
    }
}

struct ProgressionStyle: ProgressViewStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        ProgressionView(percent: CGFloat(configuration.fractionCompleted ?? 0))
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
