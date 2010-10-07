var filter = ""
  
function showAll() { $$('.filterable').invoke('show'); }

function hideAll() { $$('.filterable').invoke('hide'); }

function findAll(str) {
  showAll();
  elems = [];
  while (node = window.find(str, false, false)) {
    if (elem = window.getSelection().getRangeAt(0).startContainer.parentNode.up('.filterable')) {
      elems.push(elem);
    }
  }
  while (node = window.find(str, false, true)) {
    if (elem = window.getSelection().getRangeAt(0).startContainer.parentNode.up('.filterable')) {
      elems.push(elem);
    }
  }
  if (elems.first()) {
    hideAll();
    elems.invoke('show');
    filter = "";
  }
}

Event.observe(window, 'keydown', function (e){
  if (e.keyCode == 13) {
    findAll(filter);
    filter = "";
  } else if (e.keyCode == 27) {
    showAll();    
    filter = "";
  } else if ((e.keyCode > 64) && (e.keyCode < 91)) {
    filter += String.fromCharCode(e.keyCode);
  }
});
