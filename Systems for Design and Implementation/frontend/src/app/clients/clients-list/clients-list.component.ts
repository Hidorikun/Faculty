import { Component, OnInit } from '@angular/core';
import {Client} from '../share/client.model'
import {ClientService} from "../share/client.service";
import {Router} from "@angular/router";

@Component({
  selector: 'app-clients-list',
  templateUrl: './clients-list.component.html',
  styleUrls: ['./clients-list.component.css']
})

export class ClientsListComponent implements OnInit {


  clients: Array<Client>;
  selectedClient : Client;
  constructor(private clientService : ClientService,
              private router: Router) { }


  ngOnInit() {
    this.getClients();
  }

  getClients(){
    this.clientService.getClientsFromService()
      .subscribe(
      clients => this.clients = clients
    )
  }

  onSelect(client: Client): void {
    this.selectedClient = client;
  }

  gotoDetail(): void {
    this.router.navigate(['/client/detail', this.selectedClient.id]);
  }

  delete(client: Client): void {
    this.clientService.delete(client.id)
      .subscribe(_ => {
        this.clients = this.clients.filter(c => c !== client);
        if (this.selectedClient === client) {
          this.selectedClient = null;
        }
      },
      error => {
        console.log("an error occurred: ", error);
        alert("Something went wrong!");
      });
  }

}
