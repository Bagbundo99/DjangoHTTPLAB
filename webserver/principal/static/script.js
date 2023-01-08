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



