import { Component, OnInit, Input } from '@angular/core';
import { Person1Service } from './person1-shared/person1.service';
import { Person1 } from './person1-shared/person1.module';

@Component({
  selector: 'app-person1',
  templateUrl: './person1.component.html',
  styleUrls: ['./person1.component.css']
})
export class Person1Component implements OnInit {
  @Input() person1: Person1;
  person1s: Array<Person1> = [];

  constructor(public person1Service: Person1Service) { }

  ngOnInit() {
    this.person1Service.getPerson1s()
      .subscribe(person1s => this.person1s = person1s);
  }

}
