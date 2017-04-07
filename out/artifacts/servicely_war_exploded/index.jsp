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
    <link href="public/css/all.css" rel="stylesheet">

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
<%@include file="resources/views/partials/navbar.jsp"%>

<div id="app">

    <div class="row grey-background" style="background: url('public/images/hand-with-phone.jpg') no-repeat  right fixed #F9F9F9; ">
    <div class="container">
        <div class="row">
            <div class="col l6">
                <h1 class="banner-text">
                    <br>
                    <br>
                    Get Serviced
                    By Servicely
                </h1>
                <ul>
                    <div class="card z-depth-3" style="border-radius: 1000px" ><li style="padding: 15px"><a class="btn-floating btn-large waves-effect waves-light mdl-color--light-green">	&#10004;</a> <span  style="font-size: 1.6em; font-family: 'Roboto'"> Timely Alerts </span ></li>
                    </div>
                    <div class="card z-depth-3" style="border-radius: 1000px" ><li style="padding: 15px"><a class="btn-floating btn-large waves-effect waves-light mdl-color--light-green">	&#10004;</a> <span  style="font-size: 1.6em; font-family: 'Roboto'"> Cost-Effective Service </span ></li>
                    </div>
                    <div class="card z-depth-3" style="border-radius: 1000px" ><li style="padding: 15px"><a class="btn-floating btn-large waves-effect waves-light mdl-color--light-green">	&#10004;</a> <span  style="font-size: 1.6em; font-family: 'Roboto'"> Large Collection Of Devices </span ></li>
                    </div>
                </ul>
            </div>
        </div>
    </div>
</div>

    <div class="row custom-purple-color skew-it-rev">
        <div class="container white-text">
            <div class="row">
                <div class="col l12">
                    <div class="mdl-typography--text-center ">
                        <h1 class="roboto-thin skew-it">Story #1</h1>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col l6">
                    <p style="font-size: medium;" class="skew-it">I am glad my brother introduced me to Servicely. You people have really made life simple. I got my MacBook repaired at home, at the time I preferred. And the fact that the technician was Apple certified was like adding a cherry to the cake!

                        ~ Happy Servicely customer from Bangalore</p>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="container">
            <div class="row">
                <div class="col l12">
                    <h4 class="banner-text" style="font-size: 3em !important;">
                        <br>
                        <br>
                        Get Services Easily from your own hands!
                    </h4>

                    <div style="display: inline; padding-top: 12px"><a class="btn-floating btn-large waves-effect waves-light mdl-color--light-green">1</a><span style="font-size: 2em">Select Device</span></div>
                    <img src="https://s3-ap-southeast-1.amazonaws.com/sevify-wp/home/arrow1.png">
                    <div style="display: inline; padding-top: 12px"><a class="btn-floating btn-large waves-effect waves-light mdl-color--light-green">2</a><span style="font-size: 2em">Select Service</span></div>
                    <img src="https://s3-ap-southeast-1.amazonaws.com/sevify-wp/home/arrow1.png">
                    <div style="display: inline; padding-top: 12px"><a class="btn-floating btn-large waves-effect waves-light mdl-color--light-green">3</a><span style="font-size: 2em">Get Service</span></div>

                </div>
            </div>
        </div>
    </div>

    <div class="row custom-purple-color skew-it-rev">
        <div class="container white-text">
            <div class="row">
                <div class="col l12">
                    <div class="mdl-typography--text-center ">
                        <h1 class="roboto-thin skew-it">Story #2</h1>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col l6">
                    <p style="font-size: medium;" class="skew-it">Servicely is incredibly useful. Imagine all it takes is to add a device and billing details – everything else is so simple! Makes me wonder how I ever got by without it.
                        ~ Happy Servicely customer from Mumbai</p>
                </div>
            </div>
        </div>
    </div>
    <div class="row" style=" background: url('public/images/xpert.jpg') no-repeat  left fixed #F9F9F9; margin-bottom: 0px !important;">
        <div class="container">
            <div class="row">
                <div class="col offset-l6 l6">
                    <h1 class="banner-text">
                        <br>
                        <br>
                        Brand Authorized Experts
                    </h1>
                    <ul>
                        <div class="card z-depth-3" style="border-radius: 1000px" ><li style="padding: 15px"><a class="btn-floating btn-large waves-effect waves-light mdl-color--light-green">	&#10004;</a> <span  style="font-size: 1.6em; font-family: 'Roboto'"> Trained by brand </span ></li>
                        </div>
                        <div class="card z-depth-3" style="border-radius: 1000px" ><li style="padding: 15px"><a class="btn-floating btn-large waves-effect waves-light mdl-color--light-green">	&#10004;</a> <span  style="font-size: 1.6em; font-family: 'Roboto'"> Genuine parts </span ></li>
                        </div>
                        <div class="card z-depth-3" style="border-radius: 1000px" ><li style="padding: 15px"><a class="btn-floating btn-large waves-effect waves-light mdl-color--light-green">	&#10004;</a> <span  style="font-size: 1.6em; font-family: 'Roboto'"> Servicely verified </span ></li>
                        </div>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="row custom-purple-color">
        <div class="container white-text">
            <div class="row">
                <div class="col l6">
                    <div class="mdl-typography--text-center "  style="border-right: solid white 1px">
                        <h3 class="roboto-thin">DEVICES REGISTERED</h3><br>
                        <h3>12332</h3>

                    </div>
                </div>
                <vr></vr>
                <div class="col l6">
                    <div class="mdl-typography--text-center ">
                        <h3 class="roboto-thin">DEVICES ASSISTED</h3><br>
                        <h3>12332</h3>

                    </div>
                </div>
        </div>
        </div>
    </div>


</div>


<%@include file="resources/views/partials/footer.jsp"%>
<!-- Scripts -->
<script src="public/js/all.js"></script>
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
</script>
</body>
</html>
