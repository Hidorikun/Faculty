import { Component, OnInit, Input } from '@angular/core';
import { Person1 } from '../person1-shared/person1.module';


@Component({
  selector: 'app-person1-list',
  templateUrl: './person1-list.component.html',
  styleUrls: ['./person1-list.component.css']
})
export class Person1ListComponent implements OnInit {
  @Input() person1s: Array<Person1>;

  constructor() { }

  ngOnInit() {
  }

}
