import { Component, OnInit } from '@angular/core';
import {PizzaService} from "./share/pizza.service";
import {Location} from '@angular/common';
import { Pizza } from './share/pizza.model';

@Component({
  selector: 'app-pizza',
  templateUrl: './pizza.component.html',
  styleUrls: ['./pizza.component.css']
})
export class PizzaComponent implements OnInit {

  constructor(private pizzaService: PizzaService,
              private location: Location) { }

  show_list : boolean = false;
  pizzas : Array<Pizza>;
  ngOnInit() {
  }

  showPizzas(): void{
    this.getPizzas();
    this.show_list = !this.show_list;
  }

  goBack(): void {
    this.location.back();
  }

  save(name, description, price): void {

    this.pizzaService.create(name, description, price)
      .subscribe(
        message => console.log(message),
        error => {
          console.log("an error occurred: ", error);
          alert("Something went wrong!");
        }
      );
      this.getPizzas();
  }

  getPizzas(){
    this.pizzaService.getPizzas()
      .subscribe(
        pizzas => this.pizzas = pizzas
      )
  }
}
