import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Person1PagedComponent } from './person1-paged.component';

describe('Person1PagedComponent', () => {
  let component: Person1PagedComponent;
  let fixture: ComponentFixture<Person1PagedComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Person1PagedComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Person1PagedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
