<nav>
    <div class="nav-wrapper grey-background" style="z-index: 2">
        <div class="container">
            <a href="/" class="brand-logo grey-text-color">
                <div class="logo">
                    <%--<div class="box custom-purple-color">S</div>--%>
                    <%--<div class="text"><span class="first">Servicely</span> <span class="second"></span></div>--%>
                        <img src="/public/images/logo.png" alt="">
                </div>
            </a>
            <% if(session.getAttribute("user") == null) { %>
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                    <li><a class="grey-text-color" href="/register">Register</a></li>
                    <li><a class="grey-text-color" href="/login">Login</a></li>
                </ul>
            <% } else { %>
                 <ul id="nav-mobile" class="right hide-on-med-and-down">
                     <li><a class="grey-text-color" href="/logout">Logout</a></li>
                     <li><a class="grey-text-color" href="/cart">My Cart</a></li>
                 </ul>
           <% } %>
        </div>
    </div>
</nav>
