<%@include file="/middlewares/verifyDeviceId.jsp"%>
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
                <div class="banner-text " style="font-size: 1.5em">Catalog > Device</div>
                <hr>
            </div>
        </div>
        <div class="row">
            <div class="col l5">
                <div class="card-content">
                    <vue-slider :data="data"></vue-slider>
                </div>
            </div>
            <div class="col l7">
                <div class="card z-depth-3 hoverable">
                    <div class="card-content">
                        {{ device.name.split(" ")[0] }}
                        <span class="card-title">
                            {{ device.name }}
                        </span>
                        <hr>

                        <div class="collection with-header">
                            <div class="collection-header"><h4>Services Available</h4></div>

                            <div class="collection-item custom-list-item"
                                 :class="{'active custom-purple-color' : selected.filter((x)=> x.id == service.id).length > 0}"
                                 v-for="(service, index) in deviceServices"
                                 @click="toggle(service)"
                            >{{ service.name }}</div>

                        </div>
                        <div class="row ">

                                <div class="card-action " style="font-size: 1.5em">Total Cost : $ {{ selectedCost }}</div>
                                <div style="float:right"
                                     @click="addToCart"
                                     class="btn-large custom-purple-color waves-effect waves-light"> ADD TO CART</div>


                        </div>
                    </div>

                </div>

            </div>
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
            deviceId: <%=request.getParameter("id")%>,
            data: [
                {id: 0, src: '/public/images/iphone.jpg'},
                {id: 1, src: '/public/images/oneplus.jpg'},
                {id: 2, src: '/public/images/pixel.png'},
                {id: 3, src: '/public/images/slider.png'},
            ],
            device: {
                name: ''
            },
            deviceServices: [],
            selected: []
        },
        mounted() {
            this.fetchDevice();
            this.fetchDeviceService();
        },
        computed: {
            selectedCost () {
                let cost = 0;
                if (this.selected.length > 0)
                    this.selected.forEach((selection) => cost += selection.cost);
                return cost;
            }
        },
        methods: {
            fetchDevice() {
                let url = "/device/device.jsp?id=" + this.deviceId;
                axios.get(url)
                    .then((response) => {
                        this.device = response.data;
                    })
                    .catch((data) => {
                        window.failedAlert("Failed To Fetch Data!");
                    });
            },
            fetchDeviceService() {
                let url = "/services/device.jsp?id=" + this.deviceId;
                axios.get(url)
                    .then((response) => {
                        this.deviceServices = response.data;
                    })
                    .catch((data) => {
                        window.failedAlert("Failed To Fetch Data!");
                    });
            },
            select(obj) {
                if (this.selected.filter((x) => x.id == obj.id).length > 0)
                    return;
                this.selected.push(obj);
            },
            deselect(obj) {
                this.selected = this.selected.filter((x) => x.id != obj.id);
            },
            toggle(obj) {
                if (!this.selected.filter((x) => x.id == obj.id).length > 0) {
                    this.select(obj);

                } else {
                    this.deselect(obj);
                }
            },
            addToCart() {
                let data = {
                    device_services: this.selected.map((object) => object.device_service_id)
                };
                console.log(this.selected.map((object) => object.device_service_id));
                let url = "/cart/add.jsp";
                axios.post(url, data)
                    .then( (response) => {
                        if (response.data.success) {
                            window.successAlert(this.selected.length + " Services Added To The Cart!");
                            this.selected = [];
                        } else {
                            window.failedAlert(response.data.error);
                        }
                    }).catch( () => {
                        window.failedAlert("Failed!");
                });
            }
        }
    });
</script>
</body>
</html>
