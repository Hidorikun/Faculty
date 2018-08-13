import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {Observable} from "rxjs/Observable";
import {Pizza} from "./pizza.model";

@Injectable()
export class PizzaService {


  private pizzaUrl = 'http://localhost:8080/api/pizzas';

  constructor(private httpClient: HttpClient) {}

  getPizzas() : Observable<Array<Pizza>> {
    return this.httpClient
      .get<Array<Pizza>>(this.pizzaUrl);
  }

  create(name: string, description: string, price: number): Observable<Pizza> {
    let pizza = {name, description, price};
    return this.httpClient
      .post<Pizza>(this.pizzaUrl, pizza);
  }
}
