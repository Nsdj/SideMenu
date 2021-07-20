//
//  Initializable.swift
//  SideMenu
//
//  Created by Jon Kent on 7/2/19.
//

import Foundation

@available(iOSApplicationExtension, unavailable)
internal protocol InitializableClass: class {
    init()
}

@available(iOSApplicationExtension, unavailable)
extension InitializableClass {
    init(_ block: (Self) -> Void) {
        self.init()
        block(self)
    }

    @discardableResult func with(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
}

@available(iOSApplicationExtension, unavailable)
public protocol InitializableStruct {
    init()
}

@available(iOSApplicationExtension, unavailable)
public extension InitializableStruct {
    init(_ block: (inout Self) -> Void) {
        self.init()
        block(&self)
    }

    @discardableResult mutating func with(_ block: (inout Self) -> Void) -> Self {
        block(&self)
        return self
    }
}
