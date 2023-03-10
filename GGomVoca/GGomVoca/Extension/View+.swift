//
//  View+.swift
//  GGomVoca
//
//  Created by Roen White on 2023/01/17.
//

import SwiftUI

// MARK: View Extentsions For UI Building
extension View {
    func horizontalAlignSetting(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    func verticalAlignSetting(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    
    func headerText() -> some View {
        modifier(HeaderText())
    }
    
    func listCellText(isSelectionMode: Bool) -> some View {
        self
            .horizontalAlignSetting(.center)
            .multilineTextAlignment(.center)
            .animation(.none, value: isSelectionMode)
    }
    
    // MARK: device별로 font size를 다르게 적용
    func eachDeviceFontSize() -> some View {
        if UIDevice.current.model == "iPad" {
            return self.font(.title3)
        } else {
            return self.font(.body)
        }
    }
    
    // MARK: Custom Swipe
    func addSwipeButtonActions(leadingButtons: [CellButtons], trailingButton: [CellButtons], onClick: @escaping (CellButtons) -> Void) -> some View {
        self.modifier(SwipeContainerCell(leadingButtons: leadingButtons, trailingButton: trailingButton, onClick: onClick))
    }
}

