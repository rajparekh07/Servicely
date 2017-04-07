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
    <link href="/css/all.css" rel="stylesheet">

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
    </style>
    <!-- Scripts -->
    <script>
        window.Laravel = <?php echo json_encode([
            'csrfToken' => csrf_token(),
        ]); ?>
    </script>
    @yield('head')
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
    @include('partials.navbar')
    <canvas id=canvas></canvas>

    <div id="app">
        @yield('content')
    </div>

    <!-- Scripts -->
    <script src="/js/all.js"></script>
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
   <script>
       window.onload = function() {

           var canvas = document.getElementById("canvas");
           var ctx = canvas.getContext("2d");

           var pi = Math.PI;

           var centerX, centerY;
           var part_num = 7555;

           var mousedown = false;
           var X, Y;
           /*===========================================================================*/

           /*===========================================================================*/
           var P = [];
           var part = function(x, y, vx, vy, r, red, green, blue, alpha, col) {
               this.x = x;
               this.y = y;
               this.vx = vx;
               this.vy = vy;
               this.r = r;
               this.red = red;
               this.green = green;
               this.blue = blue;
               this.alpha = alpha;
               this.col = col;
           };

           function rand(min, max) {
               return Math.random() * (max - min) + min;
           }

           function dist(dx, dy) {
               return Math.sqrt(dx * dx + dy * dy);
           }

           function size() {
               canvas.width = window.innerWidth;
               canvas.height = window.innerHeight;

               centerX = canvas.width / 2;
               centerY = canvas.height / 2;
           }
           size();
           X = centerX;
           Y = centerY;

           function init() {
               var x, y, vx, vy, r, red, green, blue, alpha, col;
               for (var i = 0; i < part_num; i++) {
                   x = rand(0, canvas.width);
                   y = rand(0, canvas.height);
                   vx = rand(-1, 1);
                   vy = rand(-1, 1);
                   r = rand(1, 3);
                   red = Math.round(rand(150, 200));
                   green = Math.round(rand(100, 255));
                   blue = Math.round(rand(180, 255));
                   alpha = 1;
                   col = "rgba(" + red + "," + green + "," + blue + "," + alpha + ")";

                   P.push(new part(x, y, vx, vy, r, red, green, blue, alpha, col));
               }
           }

           function bg() {
               ctx.fillStyle = "#F1F1F1";
               ctx.fillRect(0, 0, canvas.width, canvas.height);
               //ctx.clearRect(0, 0, canvas.width, canvas.height);
           }

           function bounce(b) {

               if (b.x < b.r) {
                   b.x = b.r;
                   b.vx *= -1;
               }
               if (b.x > canvas.width - b.r) {
                   b.x = canvas.width - b.r;
                   b.vx *= -1;
               }

               if (b.y - b.r < 0) {
                   b.y = b.r;
                   b.vy *= -1;
               }
               if (b.y > canvas.height - b.r) {
                   b.y = canvas.height - b.r;
                   b.vy *= -1;
               }
           }

           function attract(p) {

               var dx = (p.x - X),
                       dy = (p.y - Y),
                       dist = Math.sqrt(dx * dx + dy * dy),
                       angle = Math.atan2(dy, dx);

               if (dist > 10 && dist < 100) {
                   if (!mousedown) {
                       p.vx -= (20 / (p.r * dist)) * Math.cos(angle);
                       p.vy -= (20 / (p.r * dist)) * Math.sin(angle);
                   } else if (mousedown) {
                       p.vx += (250 / (p.r * dist)) * Math.cos(angle);
                       p.vy += (250 / (p.r * dist)) * Math.sin(angle);
                   }
               }

           }

           function draw() {
               var p;
               for (var i = 0; i < P.length; i++) {
                   p = P[i];

                   if(mouseover) attract(p);
                   bounce(p);

                   p.x += p.vx;
                   p.y += p.vy;

                   p.vx *= .975;
                   p.vy *= .975;

                   ctx.fillStyle=p.col;
                   ctx.fillRect(p.x,p.y,p.r,p.r);
                   //ctx.beginPath();
                   //ctx.fillStyle = p.col;
                   //ctx.arc(p.x, p.y, p.r, 0, 2 * pi);
                   //ctx.fill();


               }
               ctx.strokeStyle = (!mousedown) ? "rgba(255,255,255,1)" : "rgba(255,0,0,1)";

               ctx.beginPath();
               ctx.moveTo(X, Y - 10);
               ctx.lineTo(X, Y + 10);
               ctx.moveTo(X - 10, Y);
               ctx.lineTo(X + 10, Y);
               ctx.stroke();

           }

           function loop() {
               bg();
               draw();

               window.requestAnimationFrame(loop);
           }

           window.onresize = size;

           window.onmousemove = function(e) {
               X = e.clientX;
               Y = e.clientY;
           }

//            window.onmousedown = function() {
//                mousedown = true;
//            }
//
//            window.onmouseup = function() {
//                mousedown = false;
//            }

           var mouseover=false;

           window.onmouseover = function() {
               mouseover = true;
           }

           window.onmouseout = function(){
               mouseover=false;
           }

           init();
           loop();
       }
   </script>
    @yield('scripts')
</body>
</html>
