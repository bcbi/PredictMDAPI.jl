#!/bin/bash

set -ev

echo "COMPILED_MODULES=$COMPILED_MODULES"
export JULIA_FLAGS="--check-bounds=yes --code-coverage=all --color=yes --compiled-modules=$COMPILED_MODULES --inline=no"
echo "JULIA_FLAGS=$JULIA_FLAGS"

julia $JULIA_FLAGS -e '
    import Pkg;
    Pkg.build("PredictMDAPI");
    '

julia $JULIA_FLAGS -e '
    import Pkg;
    Pkg.test("PredictMDAPI"; coverage=true);
    '

cat Project.toml
cat Manifest.toml

julia $JULIA_FLAGS -e '
    import Pkg;
    try Pkg.add("Coverage") catch end;
    '

julia $JULIA_FLAGS -e '
    import Coverage;
    import PredictMDAPI;
    cd(joinpath(dirname(pathof(PredictMDAPI)), "..",));
    Coverage.Codecov.submit(Coverage.Codecov.process_folder());
    '

cat Project.toml
cat Manifest.toml

##### End of file
