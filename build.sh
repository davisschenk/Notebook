rm -r output
mkdir output
for dir in $(find . -type d); do
    if [ -f "$dir/book.toml" ]; then
        name=$(basename "$dir")
        echo "Building: $dir ($name)"
        mkdir "output/$name"
        mdbook build "$dir" -d "$name"

        output="$dir/$name/"
        if [ $name == "index" ]; then
            output="$dir/$name/*"
        fi

        mv -v $output "output/"
        echo "Built $name into $output"
    fi
done
