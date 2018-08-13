import { Component, OnInit } from '@angular/core';
import {Location} from "@angular/common";
import {MovieService} from "../share/movie.service";

@Component({
  selector: 'app-movie-new',
  templateUrl: './movie-new.component.html',
  styleUrls: ['./movie-new.component.css']
})
export class MovieNewComponent implements OnInit {

  constructor(private movieService: MovieService,
              private location: Location) {
  }


  ngOnInit() {
  }

  goBack(): void {
    this.location.back();
  }

  save(title, director, rating): void {

    console.log(title);
    console.log(director);
    console.log(rating);
    if (!this.isValid(title, director, rating)) {
      console.log("all fields are required ");
      alert("all fields are required; rating has to be an float");
      return;
    }
    this.movieService.create(title, director, rating)
      .subscribe(
        _ => this.goBack(),
        error => {
          console.log("an error occurred: ", error);
          alert("Something went wrong!");
        });
  }

  private isValid(title, director, rating) {

    if (!title || !rating  || !director) {
      console.log("all fields are required");
      return false;
    }

    return true;
  }
}
