//
//  ViewController.swift
//  MarvelApp
//
//  Created by Asit Aslan on 31.01.2022.
//  Copyright © 2022 Asit Aslan. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewViewController {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    private var characters: Characters?
    private var isDataLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
        setupUI()
        loadData()

    }
    
    private func setupController() {
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }
    
    private func setupUI() {
        layoutCollection()
    }
    
    private func loadData(){
        spinner.startAnimating()
        var pageNumber = 0
        if !(characters?.data?.results?.isEmpty ?? false) {
            pageNumber = (characters?.data?.offset ?? 0)
        }
        serviceController.getCharacters(ofset: pageNumber, limit: 30) { result in
            self.spinner.stopAnimating()
            if pageNumber != 0 {
                self.characters?.data?.results = (self.characters?.data?.results ?? []) + (result.data?.results ?? [])
            }else{
                self.characters = result
            }
            self.homeCollectionView.reloadData()
            self.homeCollectionView.isUserInteractionEnabled = true
            self.isDataLoading = false
        } fail: { error in
            self.isDataLoading = false
            self.spinner.stopAnimating()
            self.showError(error: error)
        }
    }
    
    
    private func layoutCollection(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        var width = UIScreen.main.bounds.width
        
        layout.sectionInset = UIEdgeInsets(top: 10.0,
                                           left: 10.0,
                                           bottom: 10.0,
                                           right: 10.0)
        width = (width - 30)/2
        layout.itemSize = CGSize(width: width, height: width+40)
     
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10

        homeCollectionView.collectionViewLayout = layout
    }

    

}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters?.data?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionCell", for: indexPath) as? HomeCollectionCell else { return UICollectionViewCell() }
        cell.characters = characters?.data?.results?[indexPath.row]
        cell.delegate = self
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == homeCollectionView {
            if scrollView.contentOffset.y + scrollView.frame.size.height >= scrollView.contentSize.height {
                if (characters?.data?.total ?? 0) >= (characters?.data?.offset ?? 0)*30  {
                    if !isDataLoading {
                        characters?.data?.offset = (characters?.data?.offset ?? 0) + 1
                        isDataLoading = true
                        homeCollectionView.isUserInteractionEnabled = false
                        loadData()
                    }
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DetailViewController.push(from: self, id: characters?.data?.results?[indexPath.row].id ?? 0)
    }
}

extension HomeViewController: HomeCollectionDelegate {
    func favButton(isFav: Bool, charactersResult: CharactersResult) {
        StorageManager.addFav(isFav: isFav, charactersResult: charactersResult)
    }
}
