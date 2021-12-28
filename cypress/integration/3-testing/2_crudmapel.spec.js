it("Create Mapel", function needlogin() {
    cy.url().should('include','/');
    cy.wait(400);

    cy.get("#liMasterData").click();
    cy.get("#DataMapel").click();
    cy.contains("Data Mapel").should("be.visible");

    cy.get("body > div > div.content-wrapper > section > div > div > div.col-md-12 > div > div.card-header > h3 > button.btn.btn-primary btn-sm").click();
    cy.wait(400);
   
    cy.contains("Tambah Data Mapel").should("be.visible");
    cy.get("#nama_mapel").type("Aliran Fluida");
    cy.get("#paket_id-container").click().get('#paket_id').select('Teknik Pemesinan',{force: true});
    cy.get("#select2-kelompok-container").click().get('#kelompok').select('Pelajaran Khusus',{force: true});
    cy.get('body > div.wrapper > div.content-wrapper > section > div > div > div.modal.fade.bd-example-modal-md.tambah-mapel > div > div > div.modal-footer.justify-content-between > button.btn.btn-primary').click();


    cy.logout();

    cy.visit('/').assertRedirect('/login');
    // cy.wait(3000);

    // cy.get('#btnGroupDrop1').click()
    // cy.contains('Log Out').click()
    // cy.url().should('include','/');


});