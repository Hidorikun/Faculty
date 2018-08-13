import { Component, OnInit } from '@angular/core';
import {MovieService} from "../share/movie.service";
import {Movie} from "../share/movie.model";
import {Router} from "@angular/router";

@Component({
  selector: 'app-movies-list',
  templateUrl: './movies-list.component.html',
  styleUrls: ['./movies-list.component.css']
})
export class MoviesListComponent implements OnInit {

  private movies : Array<Movie>;
  private selectedMovie : Movie;

  constructor(private movieService : MovieService,
              private router: Router) { }



  ngOnInit() {
    this.getMovies();
  }

  getMovies(){
    this.movieService.getMoviesFromService()
      .subscribe(movies => this.movies = movies);
  }

  onSelect(movie : Movie) : void{
    this.selectedMovie = movie;
  }

  gotoDetail(): void {
    this.router.navigate(['/movie/detail', this.selectedMovie.id]);
  }

  delete(movie : Movie) : void{
    this.movieService.delete(movie.id)
      .subscribe(_ => {
        this.movies = this.movies.filter(c => c !== movie);
        if (this.selectedMovie === movie) {
          this.selectedMovie = null;
        }
      },
      error => {
        console.log("an error occurred: ", error);
        alert("Something went wrong!");
      });
  }

}
