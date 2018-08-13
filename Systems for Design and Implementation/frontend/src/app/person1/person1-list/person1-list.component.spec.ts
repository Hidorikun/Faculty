import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Person1ListComponent } from './person1-list.component';

describe('Person1ListComponent', () => {
  let component: Person1ListComponent;
  let fixture: ComponentFixture<Person1ListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Person1ListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Person1ListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
