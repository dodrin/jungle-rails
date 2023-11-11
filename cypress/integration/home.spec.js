describe('Jungle rails', () => {
  beforeEach(() => {
    cy.visit('/')
  });

  it('should load the home page', () => {
    cy.get('h3').contains('Welcome');
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
})