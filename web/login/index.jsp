<%@include file="/middlewares/loggedInMiddleWare.jsp"%>
<!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="utf-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1">

            <!-- CSRF Token -->
            <meta name="csrf-token" content="{{ csrf_token() }}">

            <title>{{ config('app.name', 'Laravel') }}</title>

            <!-- Styles -->
            <link href="../public/css/all.css" rel="stylesheet">

            <style>
                canvas {
                    position:fixed;
                    top:0;
                    left:0;
                    width:100%;
                    height:100%;
                    z-index:-1;
                }
                * {
                    margin: 0;
                    padding: 0;
                }
                .logo {
                    width: 300px;
                    height: 60px;
                    position: absolute;
                    top: 0; bottom: 0; left: 0; right: 0;
                    margin-top: 5px;
                }
                .box {
                    width: 60px;
                    height: 60px;
                    /*border: 1px solid rgba(0,0,0,.5);*/
                    border-radius: 100px;
                    background: #000;
                    color: #fff;
                    font-size: 26px;
                    font-weight: 700;
                    line-height: 60px;
                    text-align: center;
                    font-style: italic;
                    position: absolute;
                    left: 0%;
                    z-index: 2;
                    animation: test 2s;
                }
                .box:after {
                    content: "";
                    display: block;
                    height: 90%;
                    width: 1px;
                    background: #000;
                    position: absolute;
                    top: 0; right: -10px; bottom: 0;
                    margin: auto;
                    animation: expand 2s;
                }

                .text {
                    height: 60px;
                    color: #000;
                    padding-left: 80px;
                    line-height: 60px;
                    font-size: 30px;
                    font-weight: 100;
                    animation: fade 2.5s;
                }

                @keyframes expand {
                    0% { height: 0; }
                    40% { height: 0; }
                    60% { height: 80%; }
                }

                @keyframes test {
                    0% { transform: scale(0);  left: 39%; }
                    40% { transform: scale(1);  left: 39%;}
                    60% { transform: scale(1);  left: 39%;}
                    100% { left: 0%; }
                }

                @keyframes fade {
                    0% { opacity: 0; }
                    65% { opacity: 0; padding-left: 70px; }
                    100% { opacity: 1; padding-left: 80px; }
                }
                .product-image li {
                    float: left;
                    font-family: "Gotham Rounded Book", "Arial", sans-serif;
                    padding: 21px 7px;
                    margin: 30px 0;
                    text-align: center;
                    text-transform: uppercase;
                    width: 228px;
                }
            </style>
        </head>
<body>

<div id="preloader" class="preloader-body">
    <svg xmlns="http://www.w3.org/2000/svg" version="1.1">
        <defs>
            <filter id="gooey">
                <feGaussianBlur in="SourceGraphic" stdDeviation="10" result="blur"></feGaussianBlur>
                <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo"></feColorMatrix>
                <feBlend in="SourceGraphic" in2="goo"></feBlend>
            </filter>
        </defs>
    </svg>
    <div class="blob blob-0"></div>
    <div class="blob blob-1"></div>
    <div class="blob blob-2"></div>
    <div class="blob blob-3"></div>
    <div class="blob blob-4"></div>
    <div class="blob blob-5"></div>
</div>


<div id="app">
    <div class="center-align" style="padding-top: 10px">
        <img src="../public/images/logo.png" alt="">

    </div>
    <div class="center-align" >
        <h4>Get Serviced By Servicely</h4>
    </div>
    <div class="row valign" id="login-container-row" >
        <div class="col s12 m12 l4 offset-l4 valign" id="login-col">
            <div class="card hoverable" id="login-center" style="border-radius: 10px" >
                <div class="card-content custom-purple-color" style="border-radius: 10px 10px 0px 0px" id="login-card">
                    <div class="row " id="content-row">
                        <div class="col s12 m12 l12 ">
                            <p style="font-size: 2em" class="center-align white-text roboto-thin-text">
                                WELCOME
                            </p>
                            <p style="font-size: 1.5em;padding-top: 5px" class="center-align white-text roboto-thin">
                                Say hello to a better ownership experience
                            </p>

                        </div>
                    </div>
                </div>
                <div class="card-content">
                    <div class="row">
                        <form name="loginForm" id="loginForm" method="post">
                            <div class="input-field col s12 m12 l12">
                                <input id="email" type="text" name="email" autocomplete="off" v-model="email">
                                <label for="email">Email</label>
                                <div class="red-text" v-if="errors.has('email')">ERROR</div>
                            </div>
                            <div class="input-field col s12 m12 l12">
                                <input id="password" type="password" name="password" autocomplete="off" class="validate" v-model="password">
                                <label for="password">Password</label>
                                <div class="red-text" v-if="errors.has('password')">ERROR</div>
                            </div>
                            <div class="input-field col l12 center-align">
                                <button class="btn waves-effect waves-light custom-purple-color white-text" id="login-btn" type="submit" name="action" @click.prevent="login">Login
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="../resources/views/partials/footer.jsp"%>
<!-- Scripts -->
<script src="../public/js/all.js"></script>
<script>
    $(window).on('load', function() {

        $(document).ready(function() {
            setTimeout(function(){
                var p = document.getElementById('preloader').style;
                p.opacity = 1;
                (function fade(){(p.opacity-=.1)<0?p.display="none":setTimeout(fade, 25)})();
            },500);
        });

    });
    const app = new Vue({
       el: '#app',
       data : {
            email : '',
            password : ''
       },
       methods : {
           login() {
               if(this.errors.any()) return;
               let data = {
                   email : this.email,
                   password : this.password
               };
               let url = `/login/login.jsp`;
               axios.post(url, data)
                   .then((response) => {
                        if(response.data.success) {
                            window.successAlert("Success!");
                            setTimeout(function () {
                                window.location.href = '/devices';
                            },300);
                        } else {
                            window.failedAlert("Failed!");
                        }
                   }).catch(() => {
                   window.failedAlert("Failed!");
               });
           }
       }
    });
</script>
</body>
</html>
