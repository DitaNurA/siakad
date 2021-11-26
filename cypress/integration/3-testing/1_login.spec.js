describe('Refresh Database', () => {
    beforeEach(() => {
        cy.refreshDatabase();
        cy.seed('UsersSeeder');
        cy.seed('RuangSeeder');
        cy.seed('PaketSeeder');
        cy.seed('KehadiranSeeder');
        cy.seed('HariSeeder');
      });
      
      it('database succesfully refresh', () => {
        // php artisan migrate:fresh has been
        // called at this point.
      })
    it('Login', () => {
        cy.visit("/login");
        cy.url().should('include','/login');
        cy.get("#email").type("admin@gmail.com");
        cy.wait(400);
        cy.get("#password").type("12345678");
        cy.get("#btn-login").click();
        cy.contains("Dashboard").should("be.visible");
    });
 });