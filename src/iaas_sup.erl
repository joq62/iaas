%%% -------------------------------------------------------------------
%%% Author  : uabjle
%%% Description :
%%%
%%% Created : 10 dec 2012
%%% -------------------------------------------------------------------
-module(iaas_sup).

-behaviour(supervisor).
%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------
 
%% --------------------------------------------------------------------
%% Definitions 
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------
%% External exports
%% --------------------------------------------------------------------

-export([start_link/0]).

%% --------------------------------------------------------------------
%% Internal exports
%% --------------------------------------------------------------------
-export([
	 init/1
        ]).

%% --------------------------------------------------------------------
%% Macros
%% --------------------------------------------------------------------
-define(SERVER, ?MODULE).
%% Helper macro for declaring children of supervisor
-define(CHILD(M, Type), {M, {M, start, []}, permanent, 5000, Type, [M]}).
%% --------------------------------------------------------------------
%% Records
%% --------------------------------------------------------------------

%% ====================================================================
%% External functions
%% ====================================================================

start_link()->
   supervisor:start_link({local,?MODULE}, ?MODULE,[]).

%% ====================================================================
%% Server functions
%% ====================================================================
%% --------------------------------------------------------------------
%% Func: init/1
%% Returns: {ok,  {SupFlags,  [ChildSpec]}} |
%%          ignore                          |
%%          {error, Reason}
%% --------------------------------------------------------------------
init([]) ->
    {ok,{{one_for_one,5,10}, 
	 children()
	}
    }.

children()->
    [?CHILD(iaas,worker)].
%% ====================================================================
%% Internal functions
%% ====================================================================
