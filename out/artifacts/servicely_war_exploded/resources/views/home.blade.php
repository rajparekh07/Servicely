@extends('layouts.app')

@section('content')
    <div class="container">

        <div class="row">
            <h3>
                My Applications
            </h3>
        </div>
        <div class="row">
            @foreach(auth()->user()->developer->applications as $application)
                {{--<div class="card">--}}
                    {{--<div class="card-content">--}}
                        {{--<div class="card-title">--}}
                            {{--<img src="/api/application/{{$application->id}}/logo" alt="" class="responsive-img" style="height: 45px;width: 45px;">--}}
                        {{--</div>--}}
                        {{--<div class="card-content">--}}
                            {{--<p>--}}
                                {{--{{ $application->name }}--}}
                            {{--</p>--}}
                        {{--</div>--}}
                    {{--</div>--}}
                {{--</div>--}}
                <div class="card">
                    <div class="card-image waves-effect waves-block waves-light">
                        <img src="/api/application/{{$application->id}}/logo" alt="" class="activator" style="height: 45px">
                    </div>
                    <div class="card-content">
                        <span class="card-title activator grey-text text-darken-4">{{ $application->name }}<i class="material-icons right">more_vert</i></span>
                        <p><a href="#">Checkout</a></p>
                    </div>
                    <div class="card-reveal">
                        <span class="card-title grey-text text-darken-4">Card Title<i class="material-icons right">close</i></span>
                        <p>{{ $application->description }}</p>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endsection
