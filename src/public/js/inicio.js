console.log("Si sos de Konami y ves esto, por favor no nos hagas juicio por el Easter egg");


window.onload = function () {
    localStorage.setItem("KC", " ");
    document.addEventListener("keydown", function (e) {
        let updated = localStorage.getItem("KC") + e.key;
        let trigger = "ArrowUpArrowUpArrowDownArrowDownArrowLeftArrowRightArrowLeftArrowRightba";
        if (updated.includes(trigger)) {
            localStorage.removeItem("KC");
            console.log("Get stick bugged LOL");
            let RLdiv = document.getElementById("rickdiv");
            RLdiv.classList.add("rick","w3-display-middle");
            let RL = document.getElementById("rick");
            RL.classList.add("rick");
            RL.src = "https://www.youtube.com/embed/dQw4w9WgXcQ?autoplay=1";
            RL.classList.remove("hidden");
        } else {
            localStorage.setItem("KC", updated);
        }
    });
};
