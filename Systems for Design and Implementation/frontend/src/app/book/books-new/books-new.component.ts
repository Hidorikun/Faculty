import { Component, OnInit } from '@angular/core';
import { Person1Service } from '../../person1/person1-shared/person1.service';
import {Person1} from "../../person1/person1-shared/book.module";

@Component({
  selector: 'app-books-new',
  templateUrl: './books-new.component.html',
  styleUrls: ['./books-new.component.css']
})
export class BooksNewComponent implements OnInit {
  authors: Array<Person1> = [];

  constructor(public person1Service: Person1Service) { }

  ngOnInit() {
    this.person1Service.getPerson1s()
      .subscribe(authors => this.authors = authors);
  }

  saveBook(title: string, year: number, aId: number): void{
    this.person1Service.createBook(title, year, aId)
      .subscribe(
        message => console.log(message),
        error => {
          console.log("an error occured: ", error);
          alert("Something went wrong!");
        }
      )
  }

}
