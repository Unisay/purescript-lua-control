{ name = "purescript-lua-control"
, dependencies = [ "lua-newtype", "lua-prelude" ] 
, packages = ./packages.dhall
, sources = [ "src/**/*.purs" ]
, backend =
    ''
    pslua \
    --foreign-path . \
    --ps-output output \
    --lua-output-file dist/Control_Extend.lua \
    --entry Control.Extend
    ''
}
