//
//  PhotosCollectionViewController.swift
//  CameraFilter_Rx
//
//  Created by 김응철 on 2022/06/15.
//

import UIKit
import Photos
import RxCocoa
import RxSwift

class PhotosCollectionViewController: UICollectionViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        populatePhotos()
    }
    
    func populatePhotos() {
        PHPhotoLibrary.requestAuthorization(for: .readWrite, handler: { status in
            if status == .authorized {
                // access the photos from photo library
            }
        })
    }
}

