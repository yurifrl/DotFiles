function cat_with_names
    for filename in $argv
        if test -f $filename
            echo "# $filename"
            cat $filename
        else
            echo "File $filename does not exist."
        end
    end
end

