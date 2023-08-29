//
//  StorageManager.swift
//  Chat
//
//  Created by Vũ Hoàn on 12/02/1445 AH.
//

import Foundation
import FirebaseStorage

final class StorageManager {
    
    static let shared = StorageManager()
    
    private let storage = Storage.storage().reference()
    
    public typealias UploadPictureCompletion = ( Result<String,Error> ) -> Void
    
    public func uploadProfilePicture(with data: Data,
                                     fileName: String,
                                     completion: @escaping UploadPictureCompletion) {
        storage.child("image/\(fileName)").putData(data, metadata : nil, completion : { metadata, error in
            guard error == nil else {
                print("false1")
                completion(.failure(StorageErrors.failedToUpload))
                return 
            }
            self.storage.child("image/\(fileName)").downloadURL(completion: { url, error in
                guard let url = url else {
                    print("false2")
                    completion(.failure(StorageErrors.failedToGetDownloadUrl))
                    return
                }
                print("3")
                let urlString = url.absoluteString
                completion(.success(urlString))
                
            })
        })
    }
    
    public enum StorageErrors : Error {
        case failedToUpload
        case failedToGetDownloadUrl
    }
    
    public func downloadUrl(for path: String, completion: @escaping (Result<URL, Error>) -> Void) {
        let reference = storage.child(path)
        
        reference.downloadURL(completion: { url, error in
            guard let url = url, error == nil else {
                print("false here")
                completion(.failure(StorageErrors.failedToGetDownloadUrl))
                return
            }
            completion(.success(url))
        })
    }
}
