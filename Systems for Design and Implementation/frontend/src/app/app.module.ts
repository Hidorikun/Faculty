import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { ClientsComponent } from './clients/clients.component';
import { ClientsListComponent } from './clients/clients-list/clients-list.component';
import { ClientService } from "./clients/share/client.service";
import { HttpClientModule } from "@angular/common/http";
import { ClientDetailsComponent } from './clients/client-details/client-details.component';
import { FormsModule } from '@angular/forms';
import { AppRoutingModule } from './/app-routing.module';
import { ClientNewComponent } from './clients/client-new/client-new.component';
import { MoviesComponent } from './movies/movies.component';
import { MoviesListComponent } from './movies/movies-list/movies-list.component';
import { MovieService } from "./movies/share/movie.service";
import { PizzaService } from "./pizza/share/pizza.service";
import { MovieDetailsComponent } from './movies/movie-details/movie-details.component';
import { MovieNewComponent } from './movies/movie-new/movie-new.component';
import { RentsComponent } from './rents/rents.component';
import { PizzaComponent } from './pizza/pizza.component';
import { PizzaListComponent } from './pizza/pizza-list/pizza-list.component';
import { PersonComponent } from './person/person.component';
import { PersonListComponent } from './person/person-list/person-list.component';
import { PersonService } from './person/share/person.service';
import { BookComponent } from './book/book.component';
import { BookListComponent } from './book/book-list/book-list.component';
import { BookDetailComponent } from './book/book-detail/book-detail.component';
import { Person1Component } from './person1/person1.component';
import { Person1ListComponent } from './person1/person1-list/person1-list.component';
import { Person1Service } from './person1/person1-shared/person1.service';
import { Person1NewComponent } from './person1/person1-new/person1-new.component';
import { BooksNewComponent } from './book/books-new/books-new.component';
import { Person1PagedComponent } from './person1/person1-paged/person1-paged.component';

@NgModule({
  declarations: [
    AppComponent,
    ClientsComponent,
    ClientsListComponent,
    ClientDetailsComponent,
    ClientNewComponent,
    MoviesComponent,
    MoviesListComponent,
    MovieDetailsComponent,
    MovieNewComponent,
    RentsComponent,
    PizzaComponent,
    PizzaListComponent,
    PersonComponent,
    PersonListComponent,
    BookComponent,
    BookListComponent,
    BookDetailComponent,
    Person1Component,
    Person1ListComponent,
    Person1NewComponent,
    BooksNewComponent,
    Person1PagedComponent,
  ],
  imports: [
    BrowserModule,
    HttpClientModule,
    FormsModule,
    AppRoutingModule

  ],
  providers: [ClientService, MovieService, PizzaService, PersonService, Person1Service],
  bootstrap: [AppComponent]
})
export class AppModule { }
