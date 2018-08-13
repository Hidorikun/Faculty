import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs/Observable";
import {Client} from "./client.model";

import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';

@Injectable()
export class ClientService {

  private clientsUrl = 'http://localhost:8080/api/clients';

  constructor(private httpClient: HttpClient) {}


  getClientsFromService() : Observable<Array<Client>> {
    return this.httpClient
      .get<Array<Client>>(this.clientsUrl);
  }

  getClient(id: number): Observable<Client> {
    return this.getClientsFromService()
      .map(students => students.find(student => student.id === id));
  }

  create(firstName: string, lastName: string): Observable<Client> {
    let client = {firstName, lastName};
    return this.httpClient
      .post<Client>(this.clientsUrl, client);
  }

  update(client): Observable<Client> {
    const url = `${this.clientsUrl}/${client.id}`;
    return this.httpClient
      .put<Client>(url, client);
  }


  delete(id: number): Observable<Client> {
    const url = `${this.clientsUrl}/${id}`;
    return this.httpClient
      .delete<Client>(url);
  }



}
