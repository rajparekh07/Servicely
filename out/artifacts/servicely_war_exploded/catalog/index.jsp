<%@ page import="java.sql.ResultSet" %>
<%@ page import="servicely.database.Device" %>
<%@include file="/middlewares/notLoggedInMiddleWare.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>Servicely</title>

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
    <br>
    <div class="row grey-background">
        <div class="col l2">
            <ul id="slide-out" class="side-nav fixed" style="z-index: 1">
                <li class="center-align grey-background" style="padding-bottom: 20px">
                    <img src="/public/images/logo.png" alt="">
                </li>
                <li>
                    <div class="card z-depth-1-half grey-background">
                        <div class="card-content">
                            <div class="card-title center-align roboto-thin">
                                Filters
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="card">
                        <div class="center-align">
                            Search Device
                        </div>
                        <div class="card-content">
                            <input type="text"
                                   placeholder="Search"
                                   style="display: block;font-size: 16px;font-weight: 300;width: 100%;height: 45px;margin: 0;border: 0;"
                                   v-model="textFilter"
                            >

                        </div>
                    </div>
                </li>
                <li>
                    <div class="center-align">
                        Sort Devices
                    </div>
                    <div class="input-field col s12">
                        <p >
                            <input name="selectTypeSort" type="radio" id="asc" v-model="selectTypeSort" value="0"/>
                            <label for="asc" >Ascending Sort</label>
                        </p>
                        <p>
                            <input name="selectTypeSort" type="radio" id="desc" v-model="selectTypeSort" value="1"/>
                            <label for="desc" >Descending Sort</label>
                        </p>

                    </div>
                </li>
                <li class="bold"><a @click="clearFilter" class="waves-effect waves-teal">Clear Filters</a></li>
            </ul>
            <a href="#" data-activates="slide-out" class="button-collapse"><i class="material-icons">menu</i></a>

        </div>
        <div class="col l10">
            <div class="row">
                <div class="col l2">
                    <div class="banner-text roboto-thin" style="font-size: 2em">All Devices</div>
                </div>
            </div>
            <hr>
            <div class="row">
                    <div class="progress"  v-if="isLoading">
                        <div class="indeterminate"></div>
                    </div>

                    <div class="col l4" v-for="(device,index) in filteredDevices" v-else>
                        <div class="card hoverable">
                            <span class="new badge custom-purple-color"></span>
                            <div class="card-image">
                                <img src="/public/images/pixel.png">
                                <span class="card-title black-text">{{ device.type }}</span>
                            </div>
                            <div class="card-content">
                                <p>{{ device.name }}</p>
                            </div>
                            <div class="card-action custom-purple-color"
                                 @click="redirectToDevice(device.id)">
                                <a class="white-text"
                                >Visit Device Page</a>
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


            // Initialize collapse button
            $(".button-collapse").sideNav();
            // Initialize collapsible (uncomment the line below if you use the dropdown variation)
            $('.collapsible').collapsible();
            $('select').material_select();
        });

    });

    const app = new Vue({
        el : '#app',
        data : {
           devices : [],
            isLoading : true,
            textFilter : "",
            selectTypeSort : 0,
            filteredDevices : [],
       },
       computed : {
            deviceType () {
                return this.devices.map((device) => device.type).filter((type, index, types) => types.indexOf(type) === index);
            },
       },
       watch : {
           textFilter() {
               this.filterAndSort();
           },
           selectTypeSort() {
               this.filterAndSort();
           }
       },
       mounted() {
           this.fetchDevices();
       },
       methods : {
           fetchDevices() {
               let url = `/catalog/search.jsp`;
               axios.get(url)
                   .then( (response) => {
                       this.devices = response.data;
                       this.filteredDevices = response.data;
                       this.isLoading = false;
                   })
                   .catch( (data) => {
                       window.failedAlert("Failed to fetch devices");
                   });
           },
           redirectToDevice(id) {
               window.location.href = '/device/?id=' + id;
           },
            clearFilter(){
               this.isLoading = true;
               this.filteredDevices = this.devices;
                    this.textFilter = "";
                    this.selectTypeSort = 0;
                setTimeout(() => {
                    this.isLoading = false;
                },200);
           },
           filterAndSort() {
                this.isLoading = true;
               this.filteredDevices = this.devices.filter( (device) => {
                   let condition = true;
                   if(!this.textFilter == ""){
                       let text = this.textFilter.toLowerCase();
                       condition = device.name.toLowerCase().indexOf(text) > -1 || device.type.toLowerCase().indexOf(text) > -1;
                   }
                   return condition;
               }).sort((a,b) => {
                   let test = this.selectTypeSort == "1" ? 1 : -1;
                   console.log(test);
                   if(a.name < b.name) return test;
                   if(a.name > b.name) return -1*test;
                   return 0;
               });
               setTimeout(() => {
                   this.isLoading = false;
               },200);
           }
       }
    });
</script>
</body>
</html>
