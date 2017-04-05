<%@ page import="java.sql.ResultSet" %>
<%@ page import="servicely.database.Device" %>
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
        <div class="container">
            <div class="row">
                <div class="col l2">
                    <div class="banner-text roboto-thin" style="font-size: 2em">All Devices</div>
                </div>
            </div>
            <hr>
            <div class="row">
                <%
                    ResultSet rs = null;

                    try {
                        rs = Device.all();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }



                    while(rs.next()){
                %>


                    <div class="col l4">
                        <div class="card">
                            <div class="card-image">
                                <img src="/public/images/pixel.png">
                                <span class="card-title black-text"><%=rs.getString("type")%></span>
                            </div>
                            <div class="card-content">
                                <p><%=rs.getString("name")%></p>
                            </div>
                            <div class="card-action">
                                <a href="/device/?id=<%=rs.getInt("id")%>">Visit Device Page</a>
                            </div>
                        </div>

                    </div>
                <%
                        try {
                        } catch (Exception e) {
                        }
                        try {
                        } catch (Exception e) {
                        }
                    } %>
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
</script>
</body>
</html>
