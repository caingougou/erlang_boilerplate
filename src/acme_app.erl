-module(acme_app).

-behaviour(application).
-export([start/2, prep_stop/1, stop/1, config_change/3]).

%% @private
start(_StartType, _StartArgs) ->
    acme_sup:start_link().

%% @private
prep_stop(State) ->
    State.

%% @private
stop(_State) ->
    ok.

%% @private
config_change(_Changed, _New, _Removed) ->
    ok.