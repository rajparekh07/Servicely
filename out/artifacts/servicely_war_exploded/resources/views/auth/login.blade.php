@extends('layouts.app')

<style>
    .center_align {
        display: block;
        margin: 0 auto;
    }

</style>
@section('content')
    <div class="row valign-wrapper">
        <div class="col l4 m12 s12 center_align valign" id="cardCol">
            <div class="loginCard card white hoverable z-depth-4" >
                <div class="card-content " id="loginContent">
                    <img src="{!! url('/images/placeholders/user.svg') !!}" alt="" class="responsive-img center_align user-svg grey-text">
                    {{--<img class="responsive-img center_align" src="/images/logo-animation-header-sm-0005.png" />--}}
                    <h2 id="loginText" class="center-align teal-text">Login</h2>

                    <div class="row" id="loginFormDiv">

                        <form name="loginForm" id="loginForm" role="form" method="POST" action="{{ route('login') }}">
                            {{ csrf_field() }}

                            <div class="row">
                                <div class="input-field col l12 m12 s12 black-text ">
                                    {{--<i class="material-icons prefix green-text-color">mail</i>--}}
                                    <input id="email" type="email" name="email" class="validate" maxlength="64" required>
                                    <label for="email" data-error="Invalid Email Id">Email</label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col l12 m12 s12 black-text ">
                                    {{--<i class="material-icons prefix green-text-color ">lock</i>--}}
                                    <input id="password" type="password" name="password" class="validate" minlength="6" required>
                                    <label for="password" data-error="Invalid Password">Password</label>

                                </div>
                            </div>

                            <div class="row center" id="submitBtnRow">
                                <div class="col l12 m12 s12">
                                    <button id="signupBtn" class="btn waves-effect waves-light btn-large teal hoverable" type="submit" name="submit">Get Started</button>
                                </div>
                            </div>
                            <div class="col s12 l12 m12">
                                <div id="loginDiv" class="card-content center preLink grey-text text-darken-2">Wanna Join?<a id="loginLink" href="/register">Register</a></div>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>

    </div>
@endsection

@section('scripts')


@endsection
