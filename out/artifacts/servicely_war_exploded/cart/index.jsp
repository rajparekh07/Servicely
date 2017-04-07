<%@include file="/middlewares/notLoggedInMiddleWare.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Cart</title>

    <!-- Styles -->
    <link href="/public/css/all.css" rel="stylesheet">

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
        .custom-list-item {
            background-color: white;
            transition: all 0.5s ease;
        }
        .custom-list-item:hover {
            background-color: #F9F9F9;
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
<%@include file="/resources/views/partials/navbar.jsp"%>

<div id="app">

    <div class="container">
        <div class="row">
            <div class="col l12">
                <br>
                <div class="banner-text " style="font-size: 1.5em">My Cart</div>
                <hr>
            </div>
        </div>
        <div v-if="cart.length > 0">
            <div class="row">

                <table class="highlight centered">
                    <thead>
                    <tr>
                        <th>Device Name</th>
                        <th>Service Name</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr v-for="(item, index) in cart">
                        <td>{{ item.device_name }}</td>
                        <td>{{ item.service_name }}</td>
                        <td>$ {{ item.cost }}</td>
                        <td><div class="btn waves-effect waves-light red" @click="deleteFromCart(item.device_service_id)">Delete</div></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <hr>
            <div class="row">
                <div class="col l12">
                    <div class="right-align">
                        <h3 class="card-title">
                            Grand Total : $ {{ sum }}
                        </h3>
                    </div>
                    <div class="right-align">
                        <div class="btn waves-effect waves-light custom-purple-color" @click="checkout">Checkout!</div>
                    </div>
                </div>
            </div>
        </div>
        <div v-else>
            <div class="center-align banner-text" style="min-height: 100vh; font-size: 3em">Sorry, No Items In Cart Yet! :(</div>
        </div>
    </div>
</div>


<%@include file="/resources/views/partials/footer.jsp"%>
<!-- Scripts -->
<script src="/public/js/all.js"></script>
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
        el: "#app",
        data: {
            cart : []
        },
        mounted() {
            this.fetchCurrentCart();

        },
        methods: {
            fetchCurrentCart() {
                let url = '/cart/cart.jsp';

                axios.get(url)
                    .then( (response) => {
                        this.cart = response.data;
                    }).catch ( () => {
                        window.failedAlert("Failed");
                })
            },
            deleteFromCart (id) {
                let url = '/cart/delete.jsp';
                let data = {
                    device_services : id
                };
                axios.post(url, data)
                    .then( (response) => {
                        if (response.data.success) {
                            window.successAlert(1 + " Service Delete From The Cart!");
                            this.fetchCurrentCart();
                        } else {
                            window.failedAlert(response.data.error);
                        }
                    }).catch( () => {
                    window.failedAlert("Failed!");
                });
            },
            checkout() {
                window.location.href = "/checkout";
            }

        },
        computed: {
            sum () {
                let cost = 0;
                if (this.cart.length > 0)
                    this.cart.forEach((selection) => cost += selection.cost);
                return cost;
            }
        }
    });
</script>
</body>
</html>
