window.onload = function () {
    var selectorAsiento = document.getElementById("tipo_asiento");
    selectorAsiento.addEventListener("change", cambiarAsientos);
}

function cambiarAsientos() {

    var asientoGeneral = document.getElementById("general_container");
    var asientofamiliar = document.getElementById("familiar_container");
    var asientoSuite = document.getElementById("suite_container");

    switch (this.value) {
        case "general":
            asientoGeneral.style.display = 'block';
            asientofamiliar.style.display = 'none';
            asientoSuite.style.display = 'none';
            break;
        case "familiar":
            asientoGeneral.style.display = 'none';
            asientofamiliar.style.display = 'block';
            asientoSuite.style.display = 'none';
            break;
        case "suite":
            asientoGeneral.style.display = 'none';
            asientofamiliar.style.display = 'none';
            asientoSuite.style.display = 'block';
            break;
    }
}