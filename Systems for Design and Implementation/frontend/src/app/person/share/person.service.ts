import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";
import { Observable } from "rxjs/Observable";
import { Person} from "./person.model";

@Injectable()
export class PersonService {


  private personsUrl = 'http://localhost:8080/api/persons';

  constructor(private httpClient: HttpClient) {}

  getPersons() : Observable<Array<Person>>{
    return this.httpClient
      .get<Array<Person>>(this.personsUrl)
  }

  create(name: string, ssn: string): Observable<Person> {
    let person = {name, ssn};
    return this.httpClient
      .post<Person>(this.personsUrl, person);
  }

  validate(ssn: string): Observable<String> {
    return this.httpClient
      .get<String>(this.personsUrl + '/ssn/' + ssn);
  }
}
