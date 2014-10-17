-module(acme_sup).
-export([start_link/0]).

-behaviour(supervisor).
-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, {}).

%% @private
init({}) ->
    Acme =
        {acme,
            {acme, start_link, []},
            permanent, 5000, worker,
            []},

    Childspecs = [Acme],
    RestartStrategy = {one_for_one, 5, 10},
    {ok, {RestartStrategy, Childspecs}}.