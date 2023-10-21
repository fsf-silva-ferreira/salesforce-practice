describe("Test Parent Child Classes", function() {
  it("Get Message Test", function(){
      let someone = new Child('person');
      expect(someone.getMessage()).toEqual("Hello person");
  });
     
});