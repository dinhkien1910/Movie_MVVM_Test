//
//  DetailMovieVC.swift
//  Movie_MVVM_Challenge
//
//  Created by Nguyễn Đình Kiên on 17/05/2024.
//

import UIKit

enum DetailCellType: Int {
    case actors
    case similarMovie
    case detailCellTypeCount
}

class DetailMovieVC: UIViewController {

    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var imgBackDrop: UIImageView!
    @IBOutlet weak var nameMovie: UILabel!
    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var genresMovie: UILabel!
    @IBOutlet weak var languageMovie: UILabel!
    @IBOutlet weak var subInfoMovie: UILabel!
    @IBOutlet weak var imgStar1: UIImageView!
    @IBOutlet weak var imgStar2: UIImageView!
    @IBOutlet weak var imgStar3: UIImageView!
    @IBOutlet weak var imgStar4: UIImageView!
    @IBOutlet weak var imgStar5: UIImageView!
    @IBOutlet weak var averageVoteMovie: UILabel!
    @IBOutlet weak var overviewMovie: UILabel!
    @IBOutlet weak var detailTableView: UITableView!
    var movieID: Int?
    
    //ViewModel
    var viewModel: DetailMovieVM = DetailMovieVM()
    
    //Variables:
    var detailMoviesDataSource: DetailMovieViewEntity?
    private var listActors: [ActorCellVM] = []
    private var listSimilarMovies: [SimilarMovieCellVM] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.getDetailMovieData(movieID: movieID ?? 0)
        viewModel.getSimilarMovieData(movieID: movieID ?? 0)
        viewModel.getActorData(movieID: movieID ?? 0)

        setupUI()
        setupDelegate()
        // Do any additional setup after loading the view.
    }
    
    private func setupDelegate() {
        detailTableView.dataSource = self
        detailTableView.delegate = self
    }
    
    private func setupUI() {
        imgBackDrop.alpha = 0.5
    }

    private func bindViewModel() {
        viewModel.detailMovies.bind { [weak self] movies in
            guard let self = self,
                  let movies = movies else {
                return
            }

            detailMoviesDataSource = movies
            DispatchQueue.main.async {
                self.setupData()
            }
        }
        
        viewModel.similarMovies.bind { [weak self] similarMovies in
            guard let self = self,
                  let movies = similarMovies else {
                return
            }
            listSimilarMovies = movies
        }
        
        viewModel.actors.bind { [weak self] actors in
            guard let self = self,
                  let actors = actors else {
                return
            }
            listActors = actors
        }
    }
    
    private func setupData() {
        guard let data = detailMoviesDataSource else {
            imgMovie.image = UIImage(named: "placeholder")
            imgBackDrop.image = UIImage(named: "placeholder")
            return
        }
        // image
        if let imageUrl = URL(string: "https://image.tmdb.org/t/p/w780/\(data.poster )") {
            loadImage(imgURL: imageUrl, uiImageView: self.imgMovie)
        }
        if let imageUrl = URL(string: "https://image.tmdb.org/t/p/w780/\(data.backdrop )") {
            loadImage(imgURL: imageUrl, uiImageView: self.imgBackDrop)
        }

        nameMovie.text = data.name
        // genres
        var genresArray: [String] = []
        if let genres = data.genres {
            for item in genres {
                genresArray.append(item.name ?? "")
            }
        }
        let genresText = genresArray.joined(separator: " | ")
        if genresText.isEmpty {
            genresMovie.text = "No genres"
        } else {
            genresMovie.text = genresText
        }

        let arrStar: [UIImageView] = [imgStar1, imgStar2, imgStar3, imgStar4, imgStar5]
        Utilities.instance.drawStar(scoreAverage: data.averageVote, stars: arrStar)
        averageVoteMovie.text = String(format: "     %.1f", data.averageVote) + "/10"
        languageMovie.text = "Language: \(data.language)"

        let duration = Utilities.instance.formatRuntime(runtime: data.runtime)
        subInfoMovie.text = "\(data.releaseDate) (\(data.country ?? "")) \(duration)"

        overviewMovie.text = data.overview
    }
    
    func loadImage(imgURL: URL?, uiImageView: UIImageView) {
            guard let url = imgURL else { return }
            
            // Show the activity indicator
            URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
                guard let self = self else { return }
                if let error = error {
                    print("Error loading image: \(error.localizedDescription)")
                    return
                }
                
                if let data = data, let image = UIImage(data: data) {
                    // Display the loaded image
                    DispatchQueue.main.async {
                        uiImageView.image = image
                    }
                }
            }.resume()
        }
}

extension DetailMovieVC: UITableViewDelegate {
    
}

extension DetailMovieVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return DetailCellType.detailCellTypeCount.rawValue
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellActor = tableView.dequeueReusableCell(
            withIdentifier: ActorsViewCell.reusableIdentifier) as? ActorsViewCell,
              let cellSimilarMovie = tableView.dequeueReusableCell(
                withIdentifier: SimilarMovieCell.reusableIdentifier) as? SimilarMovieCell else {
            return UITableViewCell()
        }
        return UITableViewCell()
    }
    
    
}
