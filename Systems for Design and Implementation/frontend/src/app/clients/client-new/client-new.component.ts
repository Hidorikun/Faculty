import { Component, OnInit } from '@angular/core';
import {ClientService} from "../share/client.service";
import {Location} from '@angular/common';

@Component({
  selector: 'app-client-new',
  templateUrl: './client-new.component.html',
  styleUrls: ['./client-new.component.css']
})
export class ClientNewComponent implements OnInit {

  constructor(private clientService: ClientService,
              private location: Location) {
  }


  ngOnInit() {
  }

  goBack(): void {
    this.location.back();
  }

  save(firstName,  lastName): void {

    if (!this.isValid(firstName, lastName)) {
      alert("all fields are required; groupNumber has to be an int");
      return;
    }
    this.clientService.create(firstName, lastName)
      .subscribe(
        _ => this.goBack(),
        error => {
          console.log("an error occurred: ", error);
          alert(error);
        }
    );

  }

  private isValid(firstName, secondName) {

    if (!firstName || !secondName) {
      console.log("all fields are required");
      return false;
    }

    return true;
  }

}
