function read_and_print_file --argument file_path
    if test -f $file_path
        echo "# $file_path"
        cat $file_path
    else
        echo "Could not read file $file_path"
    end
end

function process_path --argument path
    if test -f $path
        read_and_print_file $path
    else if test -d $path
        for file in (find $path -type f)
            read_and_print_file $file
        end
    else
        echo "Path does not exist: $path"
    end
end

function cat_with_names --argument path
    for arg in $argv
        process_path $arg
    end
end
