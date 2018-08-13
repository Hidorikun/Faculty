import { Component, OnInit } from '@angular/core';
import {ClientService} from "../clients/share/client.service";
import {MovieService} from "../movies/share/movie.service";
import {Location} from "@angular/common";
import {Movie} from "../movies/share/movie.model";
import {Client} from "../clients/share/client.model";

@Component({
  selector: 'app-rents',
  templateUrl: './rents.component.html',
  styleUrls: ['./rents.component.css']
})
export class RentsComponent implements OnInit {

  selectedClient: Client;
  showMovies: boolean;
  selectedMovies: Movie[];
  availableMovies: Movie[];

  constructor(private clientService: ClientService,
              private movieService: MovieService,
              private location: Location) {
  }

  ngOnInit() {
    this.showMovies = false;
  }

  loadMovies(firstName: string) {
    this.showMovies = false;
    if (!firstName) {
      console.log("first name must not be emtpy");
      alert("first name must not be emtpy");
      return;
    }
    this.loadAvailableMovies();
    this.loadSelectedMovies(firstName);
  }


  private loadSelectedMovies(firstName: string) {
    this.clientService.getClientsFromService()
      .subscribe(
        clients => {
          const currentClient = clients.filter(s => s.firstName === firstName);

          if (currentClient.length === 1) {
            this.selectedClient = currentClient[0];
            this.showMovies = true;
            this.loadSelectedMoviesForClient(this.selectedClient);
          }
        });
  }

  private loadSelectedMoviesForClient(client: Client) {
    this.selectedMovies = [];
    const movieIds = client.movies;
    if (movieIds) {
      movieIds.forEach(id => {
        this.movieService.getMovie(id)
          .subscribe(
            movie => {this.selectedMovies = this.selectedMovies.concat([movie]);
            });
      });
    }
  }

  private loadAvailableMovies() {
    this.movieService.getMoviesFromService()
      .subscribe(
        movies => this.availableMovies = movies
      );
  }


  selectMovie(movie: Movie) {
    const disc = this.selectedMovies.filter(d => d === movie);
    if (disc.length > 0) {
      console.log("discipline already selected");
      alert("discipline already selected");
      return;
    }
    this.selectedMovies = this.selectedMovies.concat([movie]);
  }

  removeSelectedMovie(movie: Movie) {
    this.selectedMovies = this.selectedMovies.filter(d => d !== movie);
  }

  save() {
    this.selectedClient.movies = this.selectedMovies.map(d => d.id);
    console.log("selectedClient ", this.selectedClient);

    this.clientService.update(this.selectedClient)
      .subscribe(_ => this.goBack());
  }

  goBack(): void {
    this.location.back();
  }
}
