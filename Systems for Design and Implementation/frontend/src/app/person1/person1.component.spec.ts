import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Person1Component } from './person1.component';

describe('Person1Component', () => {
  let component: Person1Component;
  let fixture: ComponentFixture<Person1Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Person1Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Person1Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
