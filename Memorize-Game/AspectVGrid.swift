//
//  AspectVGrid.swift
//  Memorize-Game
//
//  Created by Sem Koliesnikov on 19/07/2022.
//

import SwiftUI

struct AspectVGrid<Item, ItemView>: View where ItemView: View, Item: Identifiable {
    var items: [Item]
    var aspectRaito: CGFloat
    var content: (Item) -> ItemView
    
    init(items: [Item], aspectRaito: CGFloat, @ViewBuilder content: @escaping (Item) -> ItemView) {
        self.items = items
        self.aspectRaito = aspectRaito
        self.content = content
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                let width: CGFloat = withThatFits(itemCount: items.count, in: geometry.size, itemAspectRaito: aspectRaito)
                LazyVGrid(columns: [adaptiveGridItem(width: width)], spacing: 0) {
                    ForEach(items) { item in
                        content(item).aspectRatio(aspectRaito, contentMode: .fit)
                    }
                }
                Spacer(minLength: 0)
            }
        }
    }
    
    private func adaptiveGridItem(width: CGFloat) -> GridItem {
        var gridItems = GridItem(.adaptive(minimum: width))
        gridItems.spacing = 0
        return gridItems
    }
    
    private func withThatFits(itemCount: Int, in size: CGSize, itemAspectRaito:CGFloat) -> CGFloat {
        var columCount = 1
        var rowCount = itemCount
        repeat {
            let itemWidth = size.width / CGFloat(columCount)
            let itemHieght = itemWidth / itemAspectRaito
            if CGFloat(rowCount) * itemHieght < size.height {
                break
            }
            columCount += 1
            rowCount = (itemCount + (columCount - 1)) / columCount
        } while columCount < itemCount
        if columCount > itemCount {
            columCount = itemCount
        }
        return floor(size.width / CGFloat(columCount))
    }
}



//struct AspectVGrid_Previews: PreviewProvider {
//    static var previews: some View {
//        AspectVGrid()
//    }
//}
