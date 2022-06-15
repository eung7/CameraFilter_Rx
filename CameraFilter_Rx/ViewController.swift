//
//  ViewController.swift
//  CameraFilter_Rx
//
//  Created by 김응철 on 2022/06/15.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var photoImageView: UIImageView!
    let disposeBag = DisposeBag()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Helpers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navC = segue.destination as? UINavigationController,
              let photosCVC = navC.viewControllers.first as? PhotosCollectionViewController else { return }
        photosCVC.selectedPhoto.subscribe(onNext: { [weak self] photo in
            self?.photoImageView.image = photo
        }).disposed(by: disposeBag)
    }
}

