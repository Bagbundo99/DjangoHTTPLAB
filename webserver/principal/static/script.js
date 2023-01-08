function getCookie(){
    const url = "http://principal.nachosite.com/cookie/"
        let xhr = new XMLHttpRequest()
        xhr.open('POST',url,true)
        xhr.send('')
        xhr.onload = function(){
            if (xhr.status == 200){
                console.log('Cookie done!')
            }
        }

}

function getCors(){
    const xhr = new XMLHttpRequest();
    const url = "http://error.nachosite.com/cors";

    xhr.open("GET", url);
    xhr.send();
}

function csp(){
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          loadCard(this.response);
        }
     };

    const url = "http://principal.nachosite.com/card";
    xhr.open("GET", url,true);
    xhr.responseType = 'document'
    xhr.send()
    
   

 
}

function loadCard(card){
    const doc = card
    strcard = new XMLSerializer().serializeToString(card)
    document.getElementById("Spac-Rabbit").insertAdjacentHTML("beforeend",strcard)

}

