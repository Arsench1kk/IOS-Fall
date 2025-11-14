//
//  ViewController.swift
//  TableView
//
//  Created by Арсен Абдухалық on 14.11.2025.
//

import UIKit

struct FavoriteItem {
    let image: UIImage?
    let title: String
    let subtitle: String
    let review: String
}

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    let favoriteMovies: [FavoriteItem] = [
        FavoriteItem(image: UIImage(named: "movie1"), title: "Code Geass", subtitle: "Goro Taniguchi", review: "masterpice, main character is a best written character. The plot is also the best. Everything in the movie is so well done."),
        FavoriteItem(image: UIImage(named: "movie2"), title: "Green Book", subtitle: "Peter Farrelly", review: "Deep story, deep meaning."),
        FavoriteItem(image: UIImage(named: "movie3"), title: "Memoir of a Snail", subtitle: "Yong-seok Kim", review: "just crying"),
        FavoriteItem(image: UIImage(named: "movie4"), title: "Fight Club", subtitle: "David Fincher", review: "masterpiece of phylosophy and human nature"),
        FavoriteItem(image: UIImage(named: "movie5"), title: "The Amazing Spider Man 2", subtitle: "Marc Webb", review: "my favorite Spider Man")
    ]
    
    let favoriteMusic: [FavoriteItem] = [
        FavoriteItem(image: UIImage(named: "cover1"), title: "Robbery", subtitle: "Juice WRLD", review: "chill ritm and beat, flow of words"),
        FavoriteItem(image: UIImage(named: "cover2"), title: "Wasted", subtitle: "Juice WRLD $ Lil Uzi Vert", review: "chill ritm and beat, very catchy"),
        FavoriteItem(image: UIImage(named: "cover3"), title: "Big City Life", subtitle: "V $ X V Prince", review: "chill and focus for your road of life"),
        FavoriteItem(image: UIImage(named: "cover4"), title: "Big Time Rush", subtitle: "Big Time Rush", review: "very energy and motivating"),
        FavoriteItem(image: UIImage(named: "cover5"), title: "There`s nothing holding me back", subtitle: "Shawn Mendes", review: "romantic enegy music"),
    ]
    
    let favoriteBooks: [FavoriteItem] = [
        FavoriteItem(image: UIImage(named: "book1"), title: "the picture of dorian gray", subtitle: "Oscar Wilde", review: "masterpice of philosophy"),
        FavoriteItem(image: UIImage(named: "book2"), title: "Beyond Good and Evi", subtitle: "Friedrich Wilhelm Nietzsche", review: "very hard to understand, but it gave me a lot of insight into human nature"),
        FavoriteItem(image: UIImage(named: "book3"), title: "48 laws of power", subtitle: "Robert Greene", review: "phsychology of human behavior"),
        FavoriteItem(image: UIImage(named: "book4"), title: "Who Will Cry When You Die?", subtitle: "Robin Sharma ", review: "love yourself and you will be happy"),
        FavoriteItem(image: UIImage(named: "book5"), title: "Models: Attract women through honesty", subtitle: "Mark Manson", review: "what`s the love and how build the right relationships")
    ]
    
    let favoriteCourses: [FavoriteItem] = [
        FavoriteItem(image: UIImage(named: "course1"), title: "IOS Development", subtitle: "Arman Myrzakanurov", review: "interesting and understandable lectures. Assignments are fun and not hard as some other courses."),
        FavoriteItem(image: UIImage(named: "course2"), title: "OOP", subtitle: "Kadyrgali & Zhumadir", review: "Very good teachers with helpfull reviews of the code/labs."),
        FavoriteItem(image: UIImage(named: "course3"), title: "Physical Education", subtitle: "Suienshbekov", review: "it litteraly was a DISCIPLINE that force me to be fit and strong."),
        FavoriteItem(image: UIImage(named: "course4"), title: "Russian Language", subtitle: "Galina Rabykovna", review: "Funny and interesting lessons. Midterm was filming of a short film that was very fun to make with new friends"),
        FavoriteItem(image: UIImage(named: "course5"), title: "PP2", subtitle: "Saduakas", review: "interesting tasks like games and other stuff")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0: return favoriteMovies.count
            case 1: return favoriteMusic.count
            case 2: return favoriteBooks.count
            case 3: return favoriteCourses.count
            default: return 0
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FavoriteItemCell
        
        let item: FavoriteItem
        switch indexPath.section {
        case 0: item = favoriteMovies[indexPath.row]
        case 1: item = favoriteMusic[indexPath.row]
        case 2: item = favoriteBooks[indexPath.row]
        case 3: item = favoriteCourses[indexPath.row]
        default: return cell
        }
        
        cell.itemimageView.image = item.image
        cell.titleLabel.text = item.title
        cell.subtitleLabel.text = item.subtitle
        cell.reviewLabel.text = item.review
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int { 4 }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "🎬 Favorite Movies"
        case 1: return "🎵 Favorite Music"
        case 2: return "📚 Favorite Books"
        case 3: return "🎓 Favorite Courses"
        default: return nil
        }
    }
}
