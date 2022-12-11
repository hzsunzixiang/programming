
Eshell V13.0.4  (abort with ^G)
1> c(coffee).
{ok,coffee}
2> coffee:module_info(attributes).
[{vsn,[60136084640283161717203717741574148931]}]
3> {ok, {coffee, MD5Digest}} = beam_lib:md5(coffee).
{ok,{coffee,<<45,61,201,226,167,10,37,6,70,182,151,179,
              181,172,211,67>>}}
4>
4> <<Int:128/integer>> = MD5Digest, Int.
60136084640283161717203717741574148931
5>

