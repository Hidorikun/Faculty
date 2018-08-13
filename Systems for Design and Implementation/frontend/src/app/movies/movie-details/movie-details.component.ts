import {Component, Input, OnInit} from '@angular/core';
import {Movie} from "../share/movie.model";
import {ActivatedRoute, Params} from "@angular/router";
import {Location} from "@angular/common";
import {MovieService} from "../share/movie.service";

@Component({
  selector: 'app-movie-details',
  templateUrl: './movie-details.component.html',
  styleUrls: ['./movie-details.component.css']
})
export class MovieDetailsComponent implements OnInit {

  @Input() movie: Movie;

  constructor(private movieService: MovieService,
              private route: ActivatedRoute,
              private location: Location) {}


  ngOnInit(): void {
    this.route.params
      .switchMap((params: Params) => this.movieService.getMovie(+params['id']))
      .subscribe(movie => this.movie = movie);
  }

  goBack(): void {
    this.location.back();
  }

  save(): void {
    this.movieService.update(this.movie)
      .subscribe(
        _ => this.goBack(),
        error => {
          console.log("an error occurred: ", error);
          alert("Something went wrong!");
        });
  }
}
