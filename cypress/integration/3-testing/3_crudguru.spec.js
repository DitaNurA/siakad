it("Create Guru", function needlogin() {
    cy.url().should('include','/');

    cy.get("#liMasterData").click();
    cy.get("#DataGuru").click();
    cy.contains("Data Guru").should("be.visible");

    
    cy.get("body > div > div.content-wrapper > section > div > div > div.col-md-12 > div > div.card-header > h3 > button.btn.btn-default.btn-sm").click();
    cy.wait(400);
    // const filepath = 'images/fahri.jpg'
    cy.contains("Tambah Data Guru").should("be.visible");
    cy.get("#nama_guru").type("Fahri");
    cy.get("#nip").type("210210345");
    cy.get("#tmp_lahir").type("Tuban");
    cy.get("#select2-jk-container").click().get('#jk').select('Laki-Laki',{force: true});
    cy.get("#select2-mapel_id-container").click().get('#mapel_id').select('Kimia', { force: true })
    cy.get("#tgl_lahir").type("1995-07-06")
    cy.get("#kode").type("102");
    cy.get("#telp").type("085785254345");
    cy.get('#foto').attachFile('fahri.jpg');
    cy.get('body > div.wrapper > div.content-wrapper > section > div > div > div.modal.fade.bd-example-modal-lg.show > div > div > div.modal-footer.justify-content-between > button.btn.btn-primary').click();
    
   
 
    cy.logout();

    cy.visit('/').assertRedirect('/login');
    // cy.wait(3000);

    // cy.get('#btnGroupDrop1').click()
    // cy.contains('Log Out').click()
    // cy.url().should('include','/');


});
