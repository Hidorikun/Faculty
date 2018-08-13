import { Component, OnInit, Input } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { Person1Service } from '../person1-shared/person1.service';
import { Person1 } from '../person1-shared/person1.module';
import {Router} from "@angular/router";

@Component({
  selector: 'app-person1-paged',
  templateUrl: './person1-paged.component.html',
  styleUrls: ['./person1-paged.component.css']
})
export class Person1PagedComponent implements OnInit {
  authors: Array<Person1> = [];
  page: number;

  constructor(
    private route: ActivatedRoute,
    private person1Service: Person1Service,
    private location: Location,
    private router: Router
  ) {}

  ngOnInit() {
    this.page = +this.route.snapshot.paramMap.get('page');
    this.person1Service.getAuthorsPaged(this.page)
      .subscribe(authors => this.authors = authors);
  }

  goBack(): void{
    this.router.navigate(['/authors/page', this.page -1]);
     window.location.reload();
  }

  next(): void{
    this.router.navigate(['/authors/page', this.page +1]);
     window.location.reload();
  }
}
