-module(partition_by_test).

-include_lib("eunit/include/eunit.hrl").

to_partition_test() ->
    ?assertEqual(<<"hola=no/adios=yes">>,
                 partition_by:to_partition([{<<"hola">>, <<"no">>}, {<<"adios">>, <<"yes">>}],
                                           <<"=">>)).

from_partition_test() ->
    ?assertEqual([{<<"hola">>, <<"no">>}, {<<"adios">>, <<"yes">>}],
                 partition_by:from_partition(<<"hola=no/adios=yes">>, <<"=">>)).
