describe('Jungle rails', () => {
  beforeEach(() => {
    cy.visit('/')
  });

  it('should load the product page', () => {
    // navigate to open the product page
    cy.get('article').contains('Giant Tea').click();

    // assert the URL contains the expected path 
    cy.url().should('include', '/products/');

    // verify that the page render the desired element
    cy.get('h1').should('contain', 'Giant Tea');
  }); 
})