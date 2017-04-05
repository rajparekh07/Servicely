<nav>
    <div class="nav-wrapper grey-background">
        <a href="/" class="brand-logo grey-text-color">
            <div class="logo">
                <div class="box teal">R</div>
                <div class="text"><span class="first">Revue</span> <span class="second"></span></div>
            </div>
        </a>
        <ul id="nav-mobile" class="right hide-on-med-and-down">
            @if((auth()->user()))
                <li><a class="grey-text-color" href="/logout">Logout</a></li>
                <li><a class="grey-text-color" href="/dashboard"> {{ auth()->user()->name }} </a></li>

            @else
                <li><a class="grey-text-color" href="/login">Login</a></li>
                <li><a class="grey-text-color" href="/register">Register</a></li>

            @endif
        </ul>
    </div>
</nav>
