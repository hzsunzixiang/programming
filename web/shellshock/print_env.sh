#!/bin/bash1

function fn(){

	       echo "123";

};


export -f fn

bash -c "printenv"


