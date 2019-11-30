//
//  FileManager+Extension.swift
//  FileManagerExtension
//
//  Created by Stewart Lynch on 2019-11-29.
//  Copyright © 2019 CreaTECH Solutions. All rights reserved.
//

import Foundation

extension FileManager {
    func docDirPath() -> String {
        let docDir = urls(for: .documentDirectory, in: .userDomainMask).first!
        return docDir.path
    }
    
    func saveDocument(contents:String, docName:String, completion: ((Error?) -> Void)? = nil) {
        let url = urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent(docName)
        do {
            try contents.write(to: url, atomically: true, encoding:.utf8)
        } catch {
            print("Could not save file to directory: \(error.localizedDescription)")
            completion!(error)
        }
    }
    
    func readDocument(docName: String, completion: (String?, Error?) -> Void) {
        let url = urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent(docName)
        do {
            completion(try String(contentsOf: url), nil)
        } catch {
            completion(nil, error)
            print(error.localizedDescription)
        }
    }
}
