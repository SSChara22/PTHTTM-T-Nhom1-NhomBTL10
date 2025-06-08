<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" defer></script>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
</head>
<body>
    <div id="app">
        <nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
            <div class="container">
                <a class="navbar-brand" href="{{ url('/') }}">
                    {{ config('app.name', 'Laravel') }}
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- Left Side Of Navbar -->
                    <ul class="navbar-nav mr-auto">

                    </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="navbar-nav ml-auto">
                        <!-- Authentication Links -->
                        @guest
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
                            </li>
                            @if (Route::has('register'))
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                                </li>
                            @endif
                        @else
                            <li class="nav-item dropdown">
                                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                    {{ Auth::user()->name }} <span class="caret"></span>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        {{ __('Logout') }}
                                    </a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                    </form>
                                </div>
                            </li>
                        @endguest
                    </ul>
                </div>
            </div>
        </nav>

        <main class="py-4">
            @yield('content')
        </main>
    </div>

    {{-- Chatbot Widget --}}
    <div id="chatbot-widget" style="position:fixed;bottom:20px;right:20px;z-index:9999;">
        <div id="chatbot-messages" style="width:300px;height:350px;overflow-y:auto;background:#fff;border:1px solid #ccc;padding:10px;border-radius:8px 8px 0 0;"></div>
        <form id="chatbot-form" style="display:flex;">
            <input type="text" id="chatbot-input" placeholder="Hỏi về sản phẩm..." style="flex:1;padding:8px;border:1px solid #ccc;border-radius:0 0 0 8px;">
            <button type="submit" style="padding:8px 12px;border:none;background:#3490dc;color:#fff;border-radius:0 0 8px 0;">Gửi</button>
        </form>
    </div>
    <script>
    document.getElementById('chatbot-form').onsubmit = async function(e) {
        e.preventDefault();
        let input = document.getElementById('chatbot-input');
        let msg = input.value.trim();
        if (!msg) return;
        let messages = document.getElementById('chatbot-messages');
        messages.innerHTML += `<div><b>Bạn:</b> ${msg}</div>`;
        input.value = '';
        messages.scrollTop = messages.scrollHeight;
        let res = await fetch('{{ route('chatbot.ask') }}', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            },
            body: JSON.stringify({message: msg})
        });
        let data = await res.json();
        messages.innerHTML += `<div><b>Bot:</b> ${data.answer}</div>`;
        messages.scrollTop = messages.scrollHeight;
    };
    </script>
</body>
</html>
