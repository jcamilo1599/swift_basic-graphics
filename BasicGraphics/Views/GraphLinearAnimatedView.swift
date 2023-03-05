//
//  GraphLinearAnimatedView.swift
//  BasicGraphics
//
//  Created by Juan Camilo Marín Ochoa on 5/03/23.
//

import SwiftUI

struct GraphLinearAnimatedView: View {
    var graph: GraphLinearModel
    var index: Int
    
    @State var showBar: Bool = false
    
    var body: some View{
        VStack(spacing: 0){
            Spacer(minLength: 0)
            
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .fill(graph.color)
                .frame(height: showBar ? nil : 0,alignment: .bottom)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.8, blendDuration: 0.8).delay(Double(index) * 0.2)){
                    showBar = true
                }
            }
        }
    }
}

struct GraphLinearAnimatedView_Previews: PreviewProvider {
    static var previews: some View {
        GraphLinearAnimatedView(
            graph: GraphLinearModel(
                value: 1000000,
                label: "1-4",
                color: ColorsTokens.primary
            ),
            index: 0
        )
    }
}
