$(function() {
    $('a[href*=#]:not([href=#])').click(function() {
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            if (target.length) {
                $('html,body').animate({
                        scrollTop: target.offset().top
                    },
                    1000);
                return false;
            }
        }
    });
});

// WHATSAPP
(function() {
    var options = {
        whatsapp: "+5511977582688", // Número do WhatsApp
        // company_logo_url: "//www.webcreative.com.br/themes/webcreative/images/perfil.jpg", // URL com o logo da empresa
        // greeting_message: "Olá! Vamos conversar!", // Texto principal
        // call_to_action: "Vamos lá, tire suas dúvidas!.", // Chamada para ação
        position: "left", // Posição do widget na página 'right' ou 'left'
    };
    var proto = document.location.protocol,
        host = "whatshelp.io",
        url = proto + "//static." + host;
    var s = document.createElement('script');
    s.type = 'text/javascript';
    s.async = true;
    s.src = url + '/widget-send-button/js/init.js';
    s.onload = function() {
        WhWidgetSendButton.init(host, proto, options);
    };
    var x = document.getElementsByTagName('script')[0];
    x.parentNode.insertBefore(s, x);
})();