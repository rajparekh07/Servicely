@extends('layouts.app')


@section('content')

    <div class="container">
        <div class="row">
            <div class="col offset-l3 l6">
                <div class="card">

                    <div class="row">
                        <div class="card-header">
                            <div class="col offset-l1 l3">
                                <div style="padding-top: 25px"><img src="/api/application/{{$app->id}}/logo" alt="" class="responsive-img" style="height: 125px;width: 125px;"></div>
                            </div>
                            <div class="col l8" style="padding-top: 20px">
                                <p class="roboto-thin card-title">{{ ($app->name) }}</p>
                                <p> Developed By : {{ $app->developer->user->name }}</p>
                                <p class="mdl-typography--font-bold">{{ $app->developer->company_name }}</span>
                                <p class="truncate">{{ $app->developer->website }}</p>
                            </div>
                        </div>
                    </div>
                    <div class="row" >
                        <div class="card-content">
                            <vue-slider :data="[
                {id: 0, src: 'http://csscience.com/responsiveslidercss3/CouldDragonByBjzaba.png'},
                {id: 1, src: 'http://localhost/api/image/generic/revueslide.png'},
                {id: 2, src: 'http://csscience.com/responsiveslidercss3/MountainOutpostByBjzaba.png'},
                {id: 3, src: 'http://csscience.com/responsiveslidercss3/CliffsByBjzaba.png'}
            ]" style="max-height: 50vh"></vue-slider>

                        </div>
                    </div>
                    <div class="row">
                        <div class="col offset-l7 card-content">
                            <button class="waves-effect waves-light btn"><i class="material-icons right">input</i>Download</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col l6 offset-l3">
                <div class="card">
                    <div class="card-content">
                        <div class="row">
                            <div class="col l12">
                                <div class="card-header">
                                    <i class="material-icons left"> mode_edit</i>
                                    <p class="roboto-thin card-title">Reviews</p>
                                </div>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <form class="col s12">
                                <div class="row">
                                    <div class="input-field col s6">
                                        <input placeholder="Placeholder" id="first_name" type="text" class="validate">
                                        <label for="first_name">First Name</label>
                                    </div>
                                    <div class="input-field col s6">
                                        <input id="last_name" type="text" class="validate">
                                        <label for="last_name">Last Name</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input disabled value="I am not editable" id="disabled" type="text" class="validate">
                                        <label for="disabled">Disabled</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="password" type="password" class="validate">
                                        <label for="password">Password</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="email" type="email" class="validate">
                                        <label for="email">Email</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col s12">
                                        This is an inline input field:
                                        <div class="input-field inline">
                                            <input id="email" type="email" class="validate">
                                            <label for="email" data-error="wrong" data-success="right">Email</label>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('scripts')

@endsection