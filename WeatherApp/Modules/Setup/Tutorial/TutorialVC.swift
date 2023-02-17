//
//  PostIntroVC.swift
//  WeatherApp
//
//  Created by Stanislav Rusakov on 16.02.23.
//

import Foundation
import UIKit

class TutorialVC: UIViewController, TutorialProtocol {

    var viewModel : TutorialVM!
    
    // MARK: - TutorialProtocol

    var onSuccess: (() -> Void)?
    
    @IBOutlet weak var btnOk: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func okBtnTapped(_ sender: Any) {
        onSuccess?()
    }
    
}
