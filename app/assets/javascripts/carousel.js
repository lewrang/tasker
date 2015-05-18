$('.carousel').carousel({
  interval: 5000 //changes the speed
})

$('tr[data-href]').on("click", function() {
  document.location = $(this).data('href');
});