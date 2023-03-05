//
//  GraphProgressView.swift
//  BasicGraphics
//
//  Created by Juan Camilo Marín Ochoa on 5/03/23.
//

import SwiftUI

struct GraphProgressView: View {
    @State private var showCircle: Bool = false
    let data: [GraphProgressModel]
    
    var body: some View {
        VStack {
            Text("Objectives Progress")
                .font(.title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                // MARK: Grafica
                ZStack{
                    ForEach(data.indices, id: \.self){ index in
                        buildCircle(circle: data[index], index: index)
                    }
                }
                
                // MARK: Textos
                VStack(spacing: 12) {
                    ForEach(data){ item in
                        Label {
                            HStack(spacing: 6) {
                                Text("\(Int(item.progress))%")
                                    .font(.title3.bold())
                                
                                Text(item.value)
                                    .lineLimit(1)
                                    .font(.body)
                            }
                            .foregroundColor(item.mainColor)
                        } icon: {
                            Image(systemName: item.icon)
                                .font(.title3)
                                .foregroundColor(item.mainColor)
                        }
                    }
                }
                .padding(.top, 40)
            }
            .padding(.horizontal, 40)
            .padding(.top, 40)
            .padding(.bottom, 20)
            .background{
                RoundedRectangle(
                    cornerRadius: 29,
                    style: .continuous
                )
                .fill(.ultraThinMaterial)
            }
        }
    }
    
    private func buildCircle(circle: GraphProgressModel, index: Int) -> some View{
        ZStack{
            Circle()
                .stroke(
                    circle.mainColor.opacity(0.15),
                    lineWidth: 32
                )
            
            Circle()
                .trim(from: 0, to: showCircle ? data[index].progress / 100 : 0)
                .stroke(
                    data[index].circleColor,
                    style: StrokeStyle(
                        lineWidth: 32,
                        lineCap: .round,
                        lineJoin: .round
                    )
                )
                .rotationEffect(.init(degrees: -90))
        }
        .padding(CGFloat(index) * 34)
        .onAppear {
            // Despues de que termine la animación inicial cargara los circulos
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1).delay(Double(index) * 0.1)) {
                    showCircle = true
                }
            }
        }
    }
}

struct GraphProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            GraphProgressView(data: [
                GraphProgressModel(
                    progress: 90,
                    value: "Invoices",
                    icon: "doc.plaintext",
                    mainColor: ColorsTokens.red,
                    circleColor: AngularGradient(
                        gradient: Gradient(colors: [
                            ColorsTokens.red,
                            ColorsTokens.pink,
                            ColorsTokens.pink,
                            ColorsTokens.red,
                        ]),
                        center: .center
                    )
                ),
                
                GraphProgressModel(
                    progress: 113,
                    value: "Income",
                    icon: "chart.line.uptrend.xyaxis",
                    mainColor: ColorsTokens.darkGreen   ,
                    circleColor: AngularGradient(
                        gradient: Gradient(colors: [
                            ColorsTokens.green,
                            ColorsTokens.lemonGreen,
                            ColorsTokens.green,
                        ]),
                        center: .center
                    )
                ),
                
                GraphProgressModel(
                    progress: 70,
                    value: "New clients",
                    icon: "person.3.fill",
                    mainColor: ColorsTokens.primary,
                    circleColor: AngularGradient(
                        gradient: Gradient(colors: [
                            ColorsTokens.lightPrimary,
                            ColorsTokens.aquaPrimary,
                            ColorsTokens.lightPrimary,
                        ]),
                        center: .center
                    )
                )
            ])
            .padding([.leading, .trailing])
        }
    }
}
