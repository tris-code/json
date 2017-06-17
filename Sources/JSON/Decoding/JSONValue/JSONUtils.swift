/*
 * Copyright 2017 Tris Foundation and the project authors
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License
 *
 * See LICENSE.txt in the project root for license information
 * See CONTRIBUTORS.txt for the list of the project authors
 */

extension String.UnicodeScalarView {
    func formIndex(
        from index: inout String.UnicodeScalarView.Index,
        consuming characters: Set<UnicodeScalar>
    ) {
        while index < endIndex, characters.contains(self[index]) {
            formIndex(after: &index)
        }
    }
}

extension Set where Element == UnicodeScalar {
    static var whitespace: Set<UnicodeScalar> = [" ", "\r", "\n", "\t"]
    static let terminator: Set<UnicodeScalar> = [" ", ",", "}", "]", "\r", "\n", "\t"]
    static let control: Set<UnicodeScalar> = ["\r", "\n", "\t"]
}

extension UnicodeScalar {
    func contained(in set: Set<UnicodeScalar>) -> Bool {
        return set.contains(self)
    }
}
