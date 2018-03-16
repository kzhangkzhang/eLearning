// listen for form submit
document.getElementById('myForm').addEventListener('submit', saveBookmark);

function saveBookmark(evt){
    // get form values
    let siteName = document.getElementById('siteName').value;
    let siteURL = document.getElementById('siteURL').value;

     // console.log(siteName);
    // console.log(siteURL);
    
    let bookmark = {
      name: siteName,
      url: siteURL
    }

    if(!validateForm(siteName, siteURL)){
      return false;
    }
    // console.log(bookmark);

    /*
    // Local Storage Test
    localStorage.setItem('test', 'Hello World');
    console.log(localStorage.getItem('test'));
    localStorage.removeItem('test');
    console.log(localStorage.getItem('test'));
    */

    if(localStorage.getItem('bookmarks') === null){
        // Init array  
        let bookmarks = [];
        // add to array
        bookmarks.push(bookmark);
        // Set to LocalStorage
        localStorage.setItem('bookmarks', JSON.stringify(bookmarks));
    } else {
      // get bookmarks from local storage
        let bookmarks = JSON.parse(localStorage.getItem('bookmarks'));
        // add to array
        bookmarks.push(bookmark);   
        // Re-Set to LocalStorage
        localStorage.setItem('bookmarks', JSON.stringify(bookmarks));  
    }

    // clear form
    document.getElementById('myForm').reset();

    // re-fetch bookmarks
    fetchBookmarks();

    // prevent event bubble up
    evt.preventDefault();
}

// delete bookmark
function deleteBookmark(url){
    // console.log(url);

    // get bookmarks from localStorage
    let bookmarks = JSON.parse(localStorage.getItem('bookmarks'));   
    // loop throught bookmarks
    for (let i = 0; i < bookmarks.length; i++){
      if(bookmarks[i].url === url){
        // remove from array
        bookmarks.splice(i, 1);

      }
    }
    
    // Re-Set to LocalStorage
    localStorage.setItem('bookmarks', JSON.stringify(bookmarks));  
         
    // re-fetch bookmarks
    fetchBookmarks();
}

// Fetch bookmarks
function fetchBookmarks(){
    // get bookmarks from local storage
    let bookmarks = JSON.parse(localStorage.getItem('bookmarks'));   
    // console.log(bookmarks);

    // get output id
    let bookmarksResults = document.getElementById('bookmarksResults');

    // build ouput
    bookmarksResults.innerHTML = '';
    for (let i = 0; i<bookmarks.length; i++){
      var name  = bookmarks[i].name;
      var url   = bookmarks[i].url;

      bookmarksResults.innerHTML += '<div class="card card-block bg-light">'+
                                    '<h3>' + name + 
                                    ' <a href="' + url + '" class="btn btn-success" target="_blank">Visit</a>' +
                                    ' <a onclick="deleteBookmark(\'' + url + '\')" href="#"' + ' class="btn btn-danger">Delete</a>' +
                                    '</h3></div>';


    }

}

function validateForm(siteName, siteURL){
    if(!siteName || !siteURL){
      alert('Please fill in the form');
      return false;
    }

      let expression = /https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)/gi;
      let regex = new RegExp(expression);

      if (!siteURL.match(regex)) {
        alert("Please enter a valid URL. Make sure you include http or https");
        return false;
      } 

      return true;
}