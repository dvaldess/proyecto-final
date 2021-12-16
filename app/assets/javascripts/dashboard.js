window.onload=function(){
    obtenerDatosUF();
    obtenerDatosDolar();
    obtenerDatosDolar2();
    obtenerDatosUTM();
}
function obtenerDatosUF(){
    //console.log('la uf');
    var url = 'https://mindicador.cl/api/uf';
    const api = new XMLHttpRequest();
    api.open('GET', url, true);
    api.send();

    api.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var datos = JSON.parse(this.responseText);
            //console.log(datos);
            var uf = datos.serie[0].valor;
            //console.log(uf);
            document.getElementById('uf').innerHTML = uf;
        }
    }
}
function obtenerDatosDolar(){
    //console.log('la uf');
    var url = 'https://mindicador.cl/api/dolar';
    const api = new XMLHttpRequest();
    api.open('GET', url, true);
    api.send();
    api.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var datos = JSON.parse(this.responseText);
            //console.log(datos);
            var dolar = datos.serie[0].valor;
            document.getElementById('dolar').innerHTML = dolar;
        }
    }
}
function obtenerDatosDolar2(){
    //console.log('la uf');
    var url = 'https://mindicador.cl/api/dolar_intercambio';
    const api = new XMLHttpRequest();
    api.open('GET', url, true);
    api.send();
    api.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var datos = JSON.parse(this.responseText);
            //console.log(datos);
            var dolar = datos.serie[0].valor;
            document.getElementById('dolar-intercambio').innerHTML = dolar;
        }
    }
}
function obtenerDatosUTM(){
    //console.log('la uf');
    var url = 'https://mindicador.cl/api/utm';
    const api = new XMLHttpRequest();
    api.open('GET', url, true);
    api.send();
    api.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var datos = JSON.parse(this.responseText);
            //console.log(datos);
            var utm = datos.serie[0].valor;
            document.getElementById('utm').innerHTML = utm;
        }
    }
}