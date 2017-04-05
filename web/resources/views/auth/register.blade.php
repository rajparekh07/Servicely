@extends('layouts.app')
@section('head')
    <style>
        .center_align {
            display: block;
            margin: 0 auto;
        }

        body {
            background: -webkit-linear-gradient(to left, #8e9eab , #eef2f3); /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to left, #8e9eab , #eef2f3); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        }
    </style>
@endsection

@section('content')
    <div class="row valign-wrapper">
        <div class="col l4 m12 s12 center_align valign" id="cardCol">
            <div class="registerCard card white hoverable z-depth-4" >
                <div class="card-content " id="registerContent">
                    <img src="{!! url('/images/placeholders/user.svg') !!}" alt="" class="responsive-img center_align user-svg grey-text">
                    {{--<img class="responsive-img center_align" src="/images/logo-animation-header-sm-0005.png" />--}}
                    <h2 id="registerText" class="center-align teal-text">Register</h2>

                    <div class="row" id="registerFormDiv">

                        <form name="registerForm" id="registerForm" role="form" method="POST" action="{{ route('register') }}">
                            {{ csrf_field() }}
                            <div class="row">
                                <div class="input-field col l12 m12 s12 black-text">
                                    {{--<i class="material-icons prefix green-text-color">perm_identity</i>--}}
                                    <input name="name" type="text" id="name" class="validate" minlength="3" maxlength="32" required>
                                    <label for="name" data-error="Invalid name">Name</label>

                                </div>
                            </div>
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
                            <div class="row">
                                <div class="input-field col l12 m12 s12 black-text ">
                                    {{--<i class="material-icons prefix green-text-color ">lock</i>--}}
                                    <input id="password-confirm" type="password" name="password_confirmation" class="validate" minlength="6" required>
                                    <label for="password-confirm" data-error="Invalid Password">Confirm Password</label>

                                </div>
                            </div>
                            <div class="row">
                                <div class="input-field col l12 m12 s12 black-text">
                                    <label for="user-type">User Type</label>
                                    <select name="user-type" id="user-type">
                                        <option value="1">Developer</option>
                                        <option value="2">User</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row center" id="submitBtnRow">
                                <div class="col l12 m12 s12">
                                    <button id="signupBtn" class="btn waves-effect waves-light btn-large teal hoverable" type="submit" name="submit">Get Started</button>
                                </div>
                            </div>
                            <div class="col s12 l12 m12">
                                <div id="loginDiv" class="card-content center preLink grey-text text-darken-2">Already a member?<a id="registerLink" href="/login">Login</a></div>
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
