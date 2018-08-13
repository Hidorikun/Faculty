import { Component, OnInit, Input } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

import { Person1 } from '../person1/person1-shared/person1.module';
import { Person1Service } from '../person1/person1-shared/person1.service';
import { Book } from './book-shared/book.module';

@Component({
  selector: 'app-book',
  templateUrl: './book.component.html',
  styleUrls: ['./book.component.css']
})
export class BookComponent implements OnInit {
  books: Array<Book> = [];
  @Input() pid: number;

  constructor(
    private route: ActivatedRoute,
    private person1Service: Person1Service,
    private location: Location
  ) {}

  ngOnInit() {
    // const pid = +this.route.snapshot.paramMap.get('pid');
    this.person1Service.getBooksByPid(this.pid)
      .subscribe(books => this.books = books);
  }

}
