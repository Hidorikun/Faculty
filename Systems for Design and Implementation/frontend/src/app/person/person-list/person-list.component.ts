import { Component, OnInit, Input } from '@angular/core';
import { Person } from '../share/person.model';

@Component({
  selector: 'app-person-list',
  templateUrl: './person-list.component.html',
  styleUrls: ['./person-list.component.css']
})
export class PersonListComponent implements OnInit {

  constructor() { }

  @Input()  persons: Array<Person>;

  ngOnInit() {
  }

}
