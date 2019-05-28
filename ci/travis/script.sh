#!/bin/bash

set -ev

julia --check-bounds=yes --color=yes -e '
    import Pkg;
    Pkg.build("PredictMDAPI");
    '

julia --check-bounds=yes --color=yes -e '
    import PredictMDAPI;
    '

julia --check-bounds=yes --color=yes -e '
    import Pkg;
    Pkg.test("PredictMDAPI"; coverage=true);
    '

julia --check-bounds=yes --color=yes -e '
    import Pkg;
    try Pkg.add("Coverage") catch end;
    '

julia --check-bounds=yes --color=yes -e '
    import Coverage;
    import PredictMDAPI;
    cd(joinpath(dirname(pathof(PredictMDAPI)), "..",));
    Coverage.Codecov.submit(Coverage.Codecov.process_folder());
    '

cat Project.toml

cat Manifest.toml

##### End of file
