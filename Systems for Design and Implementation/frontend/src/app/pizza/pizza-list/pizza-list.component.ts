import { Component, Input, OnInit } from '@angular/core';
import { Router } from "@angular/router";
import { PizzaService } from "../share/pizza.service";
import { Pizza } from '../share/pizza.model';

@Component({
  selector: 'app-pizza-list',
  templateUrl: './pizza-list.component.html',
  styleUrls: ['./pizza-list.component.css']
})
export class PizzaListComponent implements OnInit {

  @Input()  pizzas: Array<Pizza>;

  constructor() { }

  ngOnInit() {
  }
}
