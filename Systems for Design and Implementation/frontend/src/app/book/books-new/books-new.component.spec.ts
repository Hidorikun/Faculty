import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BooksNewComponent } from './books-new.component';

describe('BooksNewComponent', () => {
  let component: BooksNewComponent;
  let fixture: ComponentFixture<BooksNewComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BooksNewComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BooksNewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
