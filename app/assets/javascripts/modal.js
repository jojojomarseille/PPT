// app/assets/javascripts/modal.js

document.addEventListener('DOMContentLoaded', (event) => {
    const openModalButton = document.getElementById('openModalButton');
    const modal = document.getElementById('chatModal');
    const closeModalButton = document.getElementById('closeModalButton');
  
    openModalButton.addEventListener('click', () => {
      console.log("Bouton d'ouverture de la modale cliqué3");
      modal.style.display = 'block';
    });
  
    closeModalButton.addEventListener('click', () => {
      modal.style.display = 'none';
    });
  
    window.addEventListener('click', (event) => {
      if (event.target == modal) {
        modal.style.display = 'none';
      }
    });
  });
  