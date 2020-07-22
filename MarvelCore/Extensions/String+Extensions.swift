//
//  String+Extensions.swift
//  MarvelCore
//
//  Created by Jose Luis Fernandez on 20/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import CommonCrypto

extension String {
    
    // Code was got from: https://stackoverflow.com/questions/55356220/get-string-md5-in-swift-5
    func md5() -> String {
        let data = Data(utf8)
        var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))

        data.withUnsafeBytes { buffer in
            _ = CC_MD5(buffer.baseAddress, CC_LONG(buffer.count), &hash)
        }
        return hash.map { String(format: "%02hhx", $0) }.joined()
    }
    
}
