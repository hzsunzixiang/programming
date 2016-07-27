define(`VERSION',`A1')
VERSION # VERSION `quote' unmatched`

changecom(/*,*/)
VERSION `quote' /* VERSION
`quote' ` */ VERSION
# ->
# A1 quote /* VERSION
# `quote' ` */ A1
