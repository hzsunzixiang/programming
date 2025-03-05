
BEGIN {
    FS="\n"
    RS=""
    OFS=": "
}
{
    print $1 , $2 ,$3
}

