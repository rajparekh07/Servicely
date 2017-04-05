@extends('layouts.app')

@section('content')
    <vue-slider :data="data"></vue-slider>

    <div class="container">
        <div class="row">
            <div class="col l12">
                <h3>Top Trending Apps!</h3>
            </div>
        </div>
        <div class="row">
            @foreach(App\Application::all()->random(4) as $index => $app)

                <div class="col l3">
                    <div class="card" onclick="window.location.href='/application/{{ $app->id }}'">
                        <div class="card-image">
                            <img src="/api/application/{{$app->id}}/logo">
                        </div>
                        <div class="card-content ">
                            <p class="roboto-thin truncate">
                                <h4>{{ $app->name }}</h4>
                            </p>
                            <p class="grey-text-color">{{ $app->developer->user->name }}</p>
                        </div>
                        <div class="card-action">
                            <a href="/application/{{ $app->id }}" class="teal-text">Checkout</a>
                        </div>

                    </div>
                </div>

            @endforeach

        </div>
        <div class="row">
            <div class="col l12">
                <h3>Top Trending Categories!</h3>
            </div>
        </div>
        <div class="row">
            @foreach(App\Category::withCount('applications')->orderBy('applications_count','desc')->get()->forPage(1,5) as $category)
                <div class="col l12">
                    <div class="card">
                        <div class="card-content">
                            <h5>
                                {{ $category->name }}
                            </h5>
                            <p>
                                Top Application : {{ $category->applications->first()->name }} by {{ $category->applications->first()->developer->user->name }}
                            </p>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>

@endsection

@section('head')
    <script>
            window.data  = [
                {id: 0, src: 'http://csscience.com/responsiveslidercss3/CouldDragonByBjzaba.png'},
                {id: 1, src: 'http://localhost/api/image/generic/revueslide.png'},
                {id: 2, src: 'http://csscience.com/responsiveslidercss3/MountainOutpostByBjzaba.png'},
                {id: 3, src: 'http://csscience.com/responsiveslidercss3/CliffsByBjzaba.png'}
            ];
    </script>
@endsection