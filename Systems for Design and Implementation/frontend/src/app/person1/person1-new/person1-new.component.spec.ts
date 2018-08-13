import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Person1NewComponent } from './person1-new.component';

describe('Person1NewComponent', () => {
  let component: Person1NewComponent;
  let fixture: ComponentFixture<Person1NewComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Person1NewComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Person1NewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
