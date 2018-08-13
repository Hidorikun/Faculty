import { Component, OnInit } from '@angular/core';
import { Person1Service } from '../person1-shared/person1.service';
import { Person1 } from '../person1-shared/person1.module';

@Component({
  selector: 'app-person1-new',
  templateUrl: './person1-new.component.html',
  styleUrls: ['./person1-new.component.css']
})
export class Person1NewComponent implements OnInit {

  constructor(public person1Service: Person1Service) { }

  ngOnInit() {
  }

  saveAuthor(name: string): void{
    this.person1Service.createAuthor(name)
      .subscribe(
        message => console.log(message),
        error => {
          console.log("an error occured: ", error);
          alert("Something went wrong!");
        }
      )
  }
}
