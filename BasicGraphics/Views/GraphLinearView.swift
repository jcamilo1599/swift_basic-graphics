//
//  GraphLinearView.swift
//  BasicGraphics
//
//  Created by Juan Camilo Marín Ochoa on 5/03/23.
//

import SwiftUI

struct GraphLinearView: View {
    let data: [GraphLinearModel]
    private let height: CGFloat = 260
    private let numberRows: Int8 = 5
    
    var body: some View {
        VStack {
            Text("Last Week")
                .font(.title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(spacing: 15){
                GeometryReader{ proxy in
                    ZStack{
                        VStack(spacing: 0){
                            ForEach(getBackgroundLines(), id: \.self){ line in
                                HStack(spacing: 8){
                                    Text(reduceNumber(Int(line)))
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                        .frame(height: 20)
                                    
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.2))
                                        .frame(height: 1)
                                }
                                .frame(maxHeight: .infinity,alignment: .bottom)
                                .offset(y: -15)
                            }
                        }
                        
                        HStack{
                            ForEach(data.indices, id: \.self){ index in
                                let graph = data[index]
                                
                                VStack(spacing: 0){
                                    VStack(spacing: 0){
                                        GraphLinearAnimatedView(
                                            graph: data[index],
                                            index: index
                                        )
                                    }
                                    .frame(height: getBarHeight(point: graph.value, size: proxy.size))
                                    
                                    Text(graph.label)
                                        .font(.caption)
                                        .frame(height: 25, alignment: .bottom)
                                }
                                .frame(
                                    maxWidth: .infinity,
                                    maxHeight: .infinity,
                                    alignment: .bottom
                                )
                            }
                        }
                        .padding(.leading, 52)
                    }
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .center
                    )
                }
                .frame(height: height)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
            .background{
                RoundedRectangle(
                    cornerRadius: 20,
                    style: .continuous
                )
                .fill(.ultraThinMaterial)
            }
        }
    }
    
    // MARK: Calcula la altura de las barras
    private func getBarHeight(point: CGFloat, size: CGSize)->CGFloat{
        let max = getMax()
        let height = (point / max) * (size.height - (height / CGFloat(numberRows)))
        return height
    }
    
    // MARK: Obtiene valor de las líneas de fondo basadas en el valor máximo
    private func getBackgroundLines()->[CGFloat]{
        let max = getMax()
        var lines: [CGFloat] = []
        
        lines.append(max)
        
        for index in 1..<numberRows {
            let progress = max / (CGFloat(numberRows) - 1)
            lines.append(max - (progress * CGFloat(index)))
        }
        
        return lines
    }
    
    // MARK: Obtiene el valor mayor para determinar la altura de la grafica
    func getMax()->CGFloat{
        let max = data.max { first, second in
            return second.value > first.value
        }?.value ?? 0
        
        return max
    }
}

struct GraphLinearView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            GraphLinearView(data: [
                GraphLinearModel(value: 1000000, label: "MON", color: ColorsTokens.primary),
                GraphLinearModel(value: 250000, label: "TUE", color: ColorsTokens.primary),
                GraphLinearModel(value: 50000, label: "WED", color: ColorsTokens.primary),
                GraphLinearModel(value: 476000, label: "THU", color: ColorsTokens.primary),
                GraphLinearModel(value: 690000, label: "FRI", color: ColorsTokens.primary),
                GraphLinearModel(value: 540000, label: "SAT", color: ColorsTokens.primary),
                GraphLinearModel(value: 2040000, label: "SUN", color: ColorsTokens.primary),
            ])
            .padding([.leading, .trailing])
        }
    }
}
