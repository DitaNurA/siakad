it("Create Mapel", function () {
    cy.url().should('include','/');

    cy.get("#liMasterData").click();
    cy.get("#DataMapel").click();
    cy.contains("Data Mapel").should("be.visible");
    cy.get("body > div > div.content-wrapper > section > div > div > div.col-md-12 > div > div.card-header > h3 > button").click();


    cy.contains("Tambah Data Mapel").should("be.visible");
    cy.wait(1500);
    cy.get("#nama_mapel").type("Kimia");
    cy.wait(1500);
    cy.get("#select2-paket_id-container").click().get('#paket_id').select('Semua',{force: true});

    cy.get("#select2-kelompok-container").click().get('#kelompok').select('Pelajaran Umum',{force: true});

    cy.get("body > div.wrapper > div.content-wrapper > section > div > div > div.modal.fade.bd-example-modal-md.tambah-mapel.show > div > div > div.modal-footer.justify-content-between > button.btn.btn-primary").click();


});