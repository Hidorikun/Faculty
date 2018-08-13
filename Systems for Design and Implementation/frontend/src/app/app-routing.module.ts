import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {RouterModule, Routes} from "@angular/router";
import {ClientsComponent} from "./clients/clients.component";
import {ClientDetailsComponent} from "./clients/client-details/client-details.component";
import {ClientNewComponent} from "./clients/client-new/client-new.component";
import {MoviesComponent} from "./movies/movies.component";
import {MovieDetailsComponent} from "./movies/movie-details/movie-details.component";
import {MovieNewComponent} from "./movies/movie-new/movie-new.component";
import {RentsComponent} from "./rents/rents.component";
import {PizzaComponent} from "./pizza/pizza.component"
import {PersonComponent} from "./person/person.component";
import {Person1Component} from "./person1/person1.component";
import { BookComponent } from './book/book.component';
import { BookDetailComponent } from './book/book-detail/book-detail.component';
import { Person1NewComponent } from './person1/person1-new/person1-new.component';
import { BooksNewComponent } from './book/books-new/books-new.component';
import { Person1PagedComponent } from './person1/person1-paged/person1-paged.component';

const routes: Routes = [
  { path: 'authors/page/:page', component: Person1PagedComponent},
  { path: 'books/new', component: BooksNewComponent},
  { path: 'persons1', component: Person1Component},
  { path: 'authors/new', component: Person1NewComponent},
  { path: 'detail/:pid', component: BookComponent},
  { path: 'detail/:pid/:bid', component: BookDetailComponent},
  { path: 'registry', component: PersonComponent },
  { path: 'clients', component: ClientsComponent },
  { path: 'client/detail/:id', component: ClientDetailsComponent },
  { path: 'client/new', component: ClientNewComponent},
  { path: 'movies', component: MoviesComponent },
  { path: 'movie/detail/:id', component: MovieDetailsComponent },
  { path: 'movie/new', component: MovieNewComponent},
  { path: 'rents', component: RentsComponent },
  { path: 'pizzas', component: PizzaComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})

export class AppRoutingModule { }
