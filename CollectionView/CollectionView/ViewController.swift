//
//  ViewController.swift
//  CollectionView
//
//  Created by Miriam Hendler on 12/12/16.
//  Copyright © 2016 Miriam Hendler. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    var routes: [Route] = [
        Route(routeType: "Least Elevation", eta: 15, elevationTotal: 44),
        Route(routeType: "Fastest", eta: 13, elevationTotal: 77)
    ]
    var x = 0
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var routeNameCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        routeNameCollectionView.delegate = self
        routeNameCollectionView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        routeNameCollectionView.showsHorizontalScrollIndicator = false
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        collectionView!.collectionViewLayout = layout
         collectionView.isPagingEnabled = true
    }
    

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let translation = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
        routeNameCollectionView.contentOffset = CGPoint(x: collectionView.contentOffset.x / CGFloat(2) - CGFloat(105), y: 0)
        if translation.x  < 0 {
            print("scrolling left")
            routeNameCollectionView.contentOffset = CGPoint(x: collectionView.contentOffset.x / CGFloat(2), y: 0)
        } else {
            print("scrolling right")
        }
        // scrollView.contentOffset
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == routeNameCollectionView {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "routeNameCell", for: indexPath) as! RouteNameCollectionViewCell
            cell.routeNameLabel.text = routes[indexPath.row].routeType
        
            return cell

        }
        else  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RouteCollectionViewCell
            cell.etaLabel.text = "\(routes[indexPath.item].eta) min"
            cell.totalElevationLabel.text = "\(routes[indexPath.item].elevationTotal)ft of elevation"
            return cell
        }
    }
}

