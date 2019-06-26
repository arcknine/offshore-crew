var set_favorite = (id, title) => {
  var storage_name = 'favorites';
  var stored_ids = window.localStorage.getItem(storage_name);

  if (stored_ids == null || stored_ids == '') {
    stored_ids = []
  } else {
    stored_ids = stored_ids.split(",");
  }

  if ( stored_ids.includes(id) ) {
     var index = stored_ids.indexOf(id);
     stored_ids.splice(index, 1);
     window.localStorage.setItem(storage_name, stored_ids);

     favorite_tooltip('danger', `${title} removed from favorites.`)
  } else {
    stored_ids.push(id);
    window.localStorage.setItem(storage_name, stored_ids);

    favorite_tooltip('success', `${title} added to favorites.`)
  }
}

var favorite_tooltip = (type, message) => {
  $('#film-list').append(`
  <div class="alert alert-${type} alert-dismissible pop-up-alert" role="alert">
    ${message}
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  `);
}

var load_favorites = () => {
  var storage_name = 'favorites';
  var stored_ids = window.localStorage.getItem(storage_name);

  if (stored_ids == null || stored_ids == '') {
    return false;
  }

  stored_ids = stored_ids.split(",");
  stored_ids.forEach(function (value) {
    // set button to active
    $(`.fav-button[data-id=${value}]`).addClass('active');

    // set films to 1st in list
    var fav_div = $(`#ep${value}`);
    console.log(fav_div);
    if (fav_div.html() != undefined) {
      fav_div.remove();
      $('#film-list').prepend(`<div class="col-md-4" id="ep${value}">${fav_div.html()}</div>`);
    }
  });
  
}
 
$( document ).on('turbolinks:load', function() {
  load_favorites();

  $('.fav-button').on('click', function() {
    var id = $(this).data('id').toString();

    set_favorite(id, $(this).data('title'));

    if ($(this).hasClass('active')) {
      $(this).removeClass('active');
    } else {
      $(this).addClass('active');
    }
  })
});