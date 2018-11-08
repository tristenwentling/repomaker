
# Get installed R version
version=$(R --version | grep -oe '[0-9]\.[0-9]\.[0-9]')

# Build repository directory structure
mkdir -pv local_cran/bin/x86_64-pc-linux-gnu-library/contrib/$version
mkdir -pv local_cran/bin/windows/contrib
mkdir -pv local_cran/bin/macosx/contrib
mkdir -pv local_cran/src/contrib

dest_dir='local_cran/bin/x86_64/contrib/'"$version"
packages_dir='local_cran/src/contrib'

# Relocate R packages into repo
# mv rpkg/*.gz local_cran/src/contrib
cp rpkg/* local_cran/src/contrib/

repo_path=$(pwd)"/local_cran"

mkdir -pv ~/R/local_site_library
inst_path='~/R/local_site_library'

# Run R script that builds PACKAGES files in repo and install
echo 'Running R script'
Rscript maker.R

cp "$packages_dir"/* "$dest_dir"
Rscript maker.R
