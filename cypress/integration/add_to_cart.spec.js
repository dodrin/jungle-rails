describe('Jungle rails', () => {
  beforeEach(() => {
    cy.visit('/')
  });

  it('should add the product into cart on the home page', () => {
    
    // locate the cart text and set the integer as initialCount
    cy.get('nav .nav-link[ href="/cart" ]').invoke("text").as("initialCount");
  
    // Verify that the Add button is rendered and click it
    cy.get('.btn').contains('Add').click({ force: true});
    
    // locate the cart text again and then set as updated
    cy.get('nav .nav-link[ href="/cart" ]').invoke("text").as("updatedCount");

    // verify that initialCount != updatedCount
    // means the cart is updated, added an item successflly
    cy.get("@updatedCount").should("not.eq", "@initialCount");
  
  });
})