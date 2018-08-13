import { Component, OnInit } from '@angular/core';
import { PersonService } from './share/person.service';
import { Person } from './share/person.model';

@Component({
  selector: 'app-person',
  templateUrl: './person.component.html',
  styleUrls: ['./person.component.css']
})
export class PersonComponent implements OnInit {

  constructor(private personService : PersonService) { }

  persons : Array<Person> = [];
  name : string;
  personsLoaded : boolean = false;
  newPersonRequested : boolean = false;
  validSSN : String = '';
    ngOnInit() {
  }

  validateSSN(ssn: string): void{
    this.personService.validate(ssn)
      .subscribe(
        validSSN => this.validSSN = validSSN
      );
  }

  newPerson(): void{
      this.newPersonRequested = true;
      this.validSSN = '';
  }

  savePerson(name: string, ssn: string): void{
      this.personService.create(name, ssn)
        .subscribe(
          message => console.log(message),
          error => {
            console.log("an error occured: ", error);
            alert("Something went wrong!");
          }
        );
      this.newPersonRequested = false;
      this.loadPersons();
  }

  loadPersons(): void{
    this.personsLoaded = true;
    this.personService.getPersons()
      .subscribe(
        persons => this.persons = persons
      );
  }
}
