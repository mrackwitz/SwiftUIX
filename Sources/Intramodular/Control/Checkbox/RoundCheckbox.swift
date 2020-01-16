//
// Copyright (c) Vatsal Manot
//

import Swift
import SwiftUI

/// A checkbox control.
public struct RoundCheckbox<Label: View>: View {
    /// A view that describes the effect of toggling `isOn`.
    public let label: Label
    
    /// Whether or not `self` is currently "on" or "off".
    public let isOn: Binding<Bool>
    
    public init(isOn: Binding<Bool>, @ViewBuilder label: () -> Label) {
        self.isOn = isOn
        self.label = label()
    }
    
    public var body: some View {
        HStack {
            label
            
            Button(action: toggle) {
                isOn.wrappedValue
                    ? Image(systemName: .checkmarkCircleFill)
                    : Image(systemName: .checkmarkCircle)
            }
        }
    }
    
    private func toggle() {
        isOn.wrappedValue.toggle()
    }
}

extension RoundCheckbox where Label == EmptyView {
    public init(isOn: Binding<Bool>) {
        self.isOn = isOn
        self.label = EmptyView()
    }
}
