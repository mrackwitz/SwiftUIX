//
// Copyright (c) Vatsal Manot
//

import Swift
import SwiftUI

#if os(iOS) || os(tvOS) || targetEnvironment(macCatalyst)

@usableFromInline
struct _CollectionViewConfiguration {
    @usableFromInline
    var fixedSize: (vertical: Bool, horizontal: Bool) = (false, false)
    @usableFromInline
    var allowsMultipleSelection: Bool = false
    @usableFromInline
    var disableAnimatingDifferences: Bool = false
    #if !os(tvOS)
    @usableFromInline
    var reorderingCadence: UICollectionView.ReorderingCadence = .immediate
    #endif
    @usableFromInline
    var isDragActive: Binding<Bool>? = nil
    @usableFromInline
    var _ignorePreferredCellLayoutAttributes: Bool = false
    @usableFromInline
    var dataSourceUpdateToken: AnyHashable?
}

// MARK: - Auxiliary Implementation -

struct _CollectionViewConfigurationEnvironmentKey: EnvironmentKey {
    static let defaultValue = _CollectionViewConfiguration()
}

extension EnvironmentValues {
    var _collectionViewConfiguration: _CollectionViewConfiguration {
        get {
            self[_CollectionViewConfigurationEnvironmentKey.self]
        } set {
            self[_CollectionViewConfigurationEnvironmentKey.self] = newValue
        }
    }
}

#endif
