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
    @IBOutlet weak var applyFilterButton: UIButton!
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
        photosCVC.selectedPhotoSubject.subscribe(onNext: { [weak self] photo in
            self?.updateUI(with: photo)
        }).disposed(by: disposeBag)
    }
    
    @IBAction func applyFilterButtonPressed() {
        guard let sourceImage = self.photoImageView.image else { return }
        FilterService().applyFilter(to: sourceImage)
            .subscribe(onNext: { filteredImage in
                DispatchQueue.main.async {
                    self.photoImageView.image = filteredImage
                }
            }).disposed(by: disposeBag)
    }
    
    private func updateUI(with image: UIImage) {
        photoImageView.image = image
        applyFilterButton.isHidden = false
    }
}

