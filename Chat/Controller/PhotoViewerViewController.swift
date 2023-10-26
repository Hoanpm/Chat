//
//  PhotoViewerViewController.swift
//  Messenger
//
//  Created by Vũ Hoàn on 09/02/1445 AH.
//

import UIKit
import SDWebImage

class PhotoViewerViewController: UIViewController {
    private let url: URL
    
    init(with url : URL ) {
        self.url = url
        super.init(nibName: nil , bundle: nil )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo"
        navigationItem.largeTitleDisplayMode = .never
        view.backgroundColor = .black
        view.addSubview(imageView)
        imageView.sd_setImage(with: self.url,completed: nil)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = view.bounds
        
    }
}
