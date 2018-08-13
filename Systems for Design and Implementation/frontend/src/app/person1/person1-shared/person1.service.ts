import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
// import { Observable, of } from 'rxjs';
import { Person1 } from './person1-shared/person1.module';
import { Book } from './person1-shared/person1.module';
import {Observable} from 'rxjs/Observable';

@Injectable()
export class Person1Service {
  path = 'http://localhost:8080/api/persons1';

  constructor(public httpClient: HttpClient) { }

  getPerson1s(): Observable<Array<Person1>> {
    return this.httpClient.get<Array<Person1>>(this.path);
  }

  getBooksByPid(pid): Observable<Array<Book>> {
    return this.httpClient.get<Array<Book>>(this.path + '/books/' + pid);
  }

  createAuthor(name: string): Observable<Person1> {
    const person1 = {name};
    return this.httpClient
      .post<Person1>(this.path + '/authors', person1);
  }

  createBook(title: string, year: number, authorId: number): Observable<Book> {
    const book = {title, year, authorId};
    return this.httpClient
      .post<Person1>(this.path + '/books', book);
  }

  getAuthorsPaged(page: number): Observable<Array<Person1>> {
    return this.httpClient.get<Array<Person1>>(this.path + '/page/' + page);
  }
}
