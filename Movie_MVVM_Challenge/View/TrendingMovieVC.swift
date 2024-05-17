//
//  ViewController.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 17/05/2024.
//

import UIKit

class TrendingMovieVC: UIViewController {

    @IBOutlet weak var trendingTableView: UITableView!
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    //ViewModel
    var viewModel: TrendingMovieVM = TrendingMovieVM()
    
    //Variables:
    var trendingMoviesDataSource: [TrendingMovieCellVM] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        bindViewModel()
        viewModel.getData()
    }
    
    func setupTableView() {
        trendingTableView.register(UINib(nibName: "TrendingMovieCell", bundle: nil), forCellReuseIdentifier: "TrendingMovieCell")
        trendingTableView.delegate = self
        trendingTableView.dataSource = self
    }
    
    func bindViewModel() {
        viewModel.isLoadingData.bind { [weak self] isLoading in
            print("isLoadingData")
            guard let isLoading = isLoading else {
                print("return")
                return
            }
            DispatchQueue.main.async {
                if isLoading {
                    self?.loadingIndicator.isHidden = false
                    self?.loadingIndicator.startAnimating()
                } else {
                    self?.loadingIndicator.stopAnimating()
                    self?.loadingIndicator.isHidden = true
                }
            }
        }
        
        viewModel.movies.bind { [weak self] movies in
            guard let self = self,
                  let movies = movies else {
                return
            }
            print("bindData")

            trendingMoviesDataSource = movies
            DispatchQueue.main.async {
                self.trendingTableView.reloadData()
            }
        }
    }
}

extension TrendingMovieVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
}

extension TrendingMovieVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellMovie = tableView.dequeueReusableCell(withIdentifier: "TrendingMovieCell", for: indexPath) as? TrendingMovieCell else {
            return UITableViewCell()
        }
        cellMovie.setupCell(with: trendingMoviesDataSource[indexPath.row])
        return cellMovie
    }
    
    
}
