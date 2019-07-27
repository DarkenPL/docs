
Cypress.Commands.add "paperizeDocs", (documentName, elementToHighlight=null, options={}) ->
  selectorsToHighlight = [".v-dialog--active"]
  selectorsToHighlight.push(elementToHighlight) if elementToHighlight
  selectorsToHighlight = selectorsToHighlight.join(', ')

  # focus the given selector and the active modal
  cy.get(selectorsToHighlight)
    .invoke("css", "border-radius", "7px")
    .invoke("css", "box-shadow", "0 0 0 99999px rgba(0, 0, 0, .6)")
    .invoke("css", "z-index", "9999")

  # hide the footer: couldn't get it to shade out and it's sticky
  cy.get('footer').invoke("css", "display", "none")

  cy.wait(options.wait) if options.wait

  cy.screenshot("docs/#{documentName}", capture: 'viewport')

  cy.get('footer').invoke("css", "display", null)

  cy.get(selectorsToHighlight)
    .invoke("css", "border-radius", "0")
    .invoke("css", "box-shadow", "0 0 black")
    .invoke("css", "z-index", "1")
