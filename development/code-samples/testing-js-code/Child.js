class Child extends Parent {
  constructor(name) {
    super(name);
  }
        
  getMessage() {
    return 'Hello ' + super.getName();
  }
}