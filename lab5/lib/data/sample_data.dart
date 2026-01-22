import '../models/movie.dart';
import '../models/trailer.dart';

final List<Movie> sampleMovies = [
  Movie(
    id: 1,
    title: 'The Shawshank Redemption',
    posterUrl:
        'https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg',
    overview:
        'Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.',
    genres: ['Drama', 'Crime'],
    rating: 8.7,
    trailers: [
      Trailer(
        id: '1',
        name: 'Official Trailer',
        key: 'NmzuHjWmXOc',
        thumbnailUrl: 'https://img.youtube.com/vi/NmzuHjWmXOc/0.jpg',
      ),
      Trailer(
        id: '2',
        name: 'Theatrical Trailer',
        key: '6hB3S9bIaco',
        thumbnailUrl: 'https://img.youtube.com/vi/6hB3S9bIaco/0.jpg',
      ),
    ],
  ),
  Movie(
    id: 2,
    title: 'The Godfather',
    posterUrl:
        'https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg',
    overview:
        'Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.',
    genres: ['Drama', 'Crime'],
    rating: 8.7,
    trailers: [
      Trailer(
        id: '3',
        name: 'Original Trailer',
        key: 'sY1S34973zA',
        thumbnailUrl: 'https://img.youtube.com/vi/sY1S34973zA/0.jpg',
      ),
      Trailer(
        id: '4',
        name: '50th Anniversary Trailer',
        key: 'UaVTIH8mujA',
        thumbnailUrl: 'https://img.youtube.com/vi/UaVTIH8mujA/0.jpg',
      ),
    ],
  ),
  Movie(
    id: 3,
    title: 'The Dark Knight',
    posterUrl:
        'https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
    overview:
        'Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets. The partnership proves to be effective, but they soon find themselves prey to a reign of chaos unleashed by a rising criminal mastermind known to the terrified citizens of Gotham as the Joker.',
    genres: ['Action', 'Crime', 'Drama', 'Thriller'],
    rating: 9.0,
    trailers: [
      Trailer(
        id: '5',
        name: 'Official Trailer',
        key: 'EXeTwQWrcwY',
        thumbnailUrl: 'https://img.youtube.com/vi/EXeTwQWrcwY/0.jpg',
      ),
      Trailer(
        id: '6',
        name: 'Teaser Trailer',
        key: 'yQ5U8suTUw0',
        thumbnailUrl: 'https://img.youtube.com/vi/yQ5U8suTUw0/0.jpg',
      ),
    ],
  ),
  Movie(
    id: 4,
    title: 'Pulp Fiction',
    posterUrl:
        'https://image.tmdb.org/t/p/w500/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg',
    overview:
        'A burger-loving hit man, his philosophical partner, a drug-addled gangster\'s moll and a washed-up boxer converge in this sprawling, comedic crime caper. Their adventures unfurl in three stories that ingeniously trip back and forth in time.',
    genres: ['Thriller', 'Crime'],
    rating: 8.5,
    trailers: [
      Trailer(
        id: '7',
        name: 'Official Trailer',
        key: 's7EdQ4FqbhY',
        thumbnailUrl: 'https://img.youtube.com/vi/s7EdQ4FqbhY/0.jpg',
      ),
    ],
  ),
  Movie(
    id: 5,
    title: 'Inception',
    posterUrl:
        'https://image.tmdb.org/t/p/w500/ljsZTbVsrQSqZgWeep2B1QiDKuh.jpg',
    overview:
        'Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible: "inception", the implantation of another person\'s idea into a target\'s subconscious.',
    genres: ['Action', 'Science Fiction', 'Adventure'],
    rating: 8.8,
    trailers: [
      Trailer(
        id: '8',
        name: 'Official Trailer',
        key: 'YoHD9XEInc0',
        thumbnailUrl: 'https://img.youtube.com/vi/YoHD9XEInc0/0.jpg',
      ),
      Trailer(
        id: '9',
        name: 'Teaser Trailer',
        key: '66TuSJo4dZM',
        thumbnailUrl: 'https://img.youtube.com/vi/66TuSJo4dZM/0.jpg',
      ),
    ],
  ),
];
