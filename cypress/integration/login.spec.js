describe('Refresh Database', () => {
    beforeEach(() => {
        cy.refreshDatabase();
      });

      it('database succesfully refresh', () => {
        // php artisan migrate:fresh has been
        // called at this point.
      })
    });

    describe("Login", function () {
        beforeEach(function () {
        cy.fixture("user").then(function (user) {
            this.user = user;
            cy.visit("/login");
            cy.url().should('include','/login');
            cy.get("#email").type(this.user.email);
            cy.get("#userpassword").type(this.user.password);
            cy.get("body > div > div.card-body > form > div.row-mb-1 > div.col-5 > button").click();
    
        });
    })
});
