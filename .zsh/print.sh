version=0.1.0
input="."
output="."

fail() {
    echo "ERROR: $1"
    exit 1
}

warn() {
    echo "WARN: $1"
}

unknown_option() {
    warn "Unknown option (ignored): $1"
}

show_version() {
    echo "Version ${version}"
}

show_help() {
    echo 'Prints pdf files from markdowns.'
    echo 'Usage: print.sh [options]'
    echo ''
    echo 'Options:'
    echo '  -i, --input                   Specify path to markdown file or directory with markdown files.'
    echo '                                  Current directory is used by default.'
    echo '  -o, --output                  Specify path to output directory.'
    echo '                                  Current directory is used by default.'
    echo '  -v, --version                 Show script version.'
    echo '  -h, --help                    Show usage help.'
}

set_input() {
    if [[ -d $1 ]] || [[ -f $1 ]]; then
        input=$1
    else
        fail "$1 is not valid file or directory"
    fi
}

set_output() {
    if [[ -d $1 ]]; then
        output=$1
    else
        fail "$1 is not valid directory"
    fi
}

print_file() {
    local file=$1
    local base=$(basename $file)
    local name="${base%.*}"
    local ext="${base#*.}"
    if [ $ext == md ]; then
        echo "Printing file $file into ${output}/${name}.pdf"
        pandoc $file -f gfm -o "${output}/${name}.pdf" -V geometry:margin=1in
    fi
}

while :; do
    case $1 in
        -v|--version)
            show_version
            exit
            ;;
        -h|-\?|--help)
            show_help
            exit
            ;;
        -i|--input)
            set_input $2
            shift
            ;;
        --input=?*|--input=)
            set_input =${1#*=}
            ;;
        -o|--output)
            set_output $2
            shift
            ;;
        --output=?*|--output=)
            set_output =${1#*=}
            ;;
        -?*)
            unknown_option $1
            ;;
        *)
            break
    esac
    shift
done

if [[ -f $input ]]; then
    print_file $input
fi

if [[ -d $input ]]; then
    files=($(ls $input/*.md))
    for file in "${files[@]}"; do
        print_file $file
    done
fi

# if [[ -d $input ]]; then
#     files=($(git diff-tree -r --no-commit-id --name-only --diff-filter=ACMR --no-commit-id HEAD))
#     for file in "${files[@]}"; do
#         if [[ $input -ef $(dirname $file) ]]; then
#             print_file $file
#         fi
#     done
# fi

