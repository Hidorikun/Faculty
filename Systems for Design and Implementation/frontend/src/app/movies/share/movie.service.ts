import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs/Observable";
import {Movie} from "./movie.model";

import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';


@Injectable()
export class MovieService {

  private moviesUrl = 'http://localhost:8080/api/movies';

  constructor(private httpClient: HttpClient) { }

  getMoviesFromService() : Observable<Array<Movie>> {
    return this.httpClient
      .get<Array<Movie>>(this.moviesUrl);
  }

  getMovie(id: number): Observable<Movie> {
    return this.getMoviesFromService()
      .map(movies => movies.find(movie => movie.id === id));
  }

  create(title: string, director: string, rating: number): Observable<Movie> {
    let movie = {title, director, rating};
    return this.httpClient
      .post<Movie>(this.moviesUrl, movie);
  }

  update(movie): Observable<Movie> {
    const url = `${this.moviesUrl}/${movie.id}`;
    return this.httpClient
      .put<Movie>(url, movie);
  }


  delete(id: number): Observable<Movie> {
    const url = `${this.moviesUrl}/${id}`;
    return this.httpClient
      .delete<Movie>(url);
  }
}
