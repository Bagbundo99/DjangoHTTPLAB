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
    document.getElementsByClassName("Space-Rabbit").appendChild("<img src=\"http://error.nachosite.com/media/images.jpeg\" alt=\"Girl in a jacket\" width=\"500\" height=\"600\"></img>")
}


