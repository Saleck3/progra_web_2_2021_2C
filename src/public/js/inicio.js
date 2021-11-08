console.log("Si sos de Konami y ves esto, por favor no nos hagas juicio por el Easter egg");


window.onload = function () {
    localStorage.setItem("KC", " ");
    document.addEventListener("keydown", function (e) {
        let updated = localStorage.getItem("KC") + e.key;
        let trigger = "ArrowUpArrowUpArrowDownArrowDownArrowLeftArrowRightArrowLeftArrowRightba";
        if (updated.includes(trigger)) {
            localStorage.removeItem("KC");
            console.log("Get stick bugged LOL");
            let RL = document.getElementById("rick");
            RL.classList.remove("hidden");
            <RL className="s33555555555555">    </RL>c += "?autoplay=1";
        } else {
            localStorage.setItem("KC", updated);
        }
    });
};
