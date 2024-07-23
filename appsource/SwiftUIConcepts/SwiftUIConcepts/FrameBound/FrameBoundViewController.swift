//
//  FrameBoundViewController.swift
//  SwiftUIConcepts
//
//  Created by Purushoth on 23/07/24.
//

import UIKit

class FrameBoundViewController: UIViewController {

   
    @IBOutlet weak var boundsLabel: UILabel!
    @IBOutlet weak var frameLabel: UILabel!
    @IBOutlet weak var rotateButton: UIButton!
    @IBOutlet weak var chidView: UIView!

    var rotationDegrees: CGFloat = 0


    var demoView: UIView!
    var frameView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func setupDemoView() {
        demoView  = UIView(frame: .zero)
        demoView.backgroundColor = UIColor.blue
        view.addSubview(demoView)
        // Setup auto-layout constraints.
        demoView.translatesAutoresizingMaskIntoConstraints = false
        demoView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        demoView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        demoView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        demoView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }

    func setupFrameView() {
        frameView = UIView(frame: .zero)
        frameView.backgroundColor = UIColor.yellow
        self.view.addSubview(frameView)
    }


    @IBAction func rotateButtonTapped(_ sender: UIButton) {
       didRotate()
    }

    func didRotate()  {
        rotationDegrees += 30
        demoView.transform = CGAffineTransform(rotationAngle: rotationDegrees * .pi / 180)
        frameView.frame = demoView.frame
        updateLabel()
    }


    func updateLabel() {
        frameLabel.text = """
                    **FRAME**
                    X: \(demoView.frame.origin.x.rounded())
                    Y: \(demoView.frame.origin.y.rounded())
                    Width: \(demoView.frame.size.width.rounded())
                    Height: \(demoView.frame.size.height.rounded())
        """

        boundsLabel.text = """
                    **BOUNDS**
                    X: \(demoView.bounds.origin.x)
                    Y: \(demoView.bounds.origin.y)
                    Width: \(demoView.bounds.size.width)
                    Height: \(demoView.bounds.size.height)
        """

    }


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         setupFrameView()
         setupDemoView()
        view.layoutIfNeeded()
         updateLabel()
    }



}


