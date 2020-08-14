
import Foundation

// MARK: - MovieListCodable
struct MoviesModelCodable: Codable {
    let results: [MoviesModelResult]!
   
    enum CodingKeys: String, CodingKey {
        case results
    }
}

// MARK: - Result
struct MoviesModelResult: Codable {
   
    let posterPath: String!
    let id: Int!
    let title: String!
    let voteAverage: Double!
    let releaseDate: String!

    enum CodingKeys: String, CodingKey {
       
        case posterPath = "poster_path"
        case id
        case title
        case voteAverage = "vote_average"
        case releaseDate = "release_date"
    }
}
