
function fetch_and_archive
    # Iterate through all directories in the current folder
    for dir in */
        # Enter the directory
        cd $dir
        # Fetch all remote branches and tags
        git fetch --all
        # Return to the parent directory
        cd ..
    end

    # Create a tar.gz archive of the current folder, named "archive.tar.gz"
    # Exclude common dependency folders like node_modules and vendor (Go modules)
    tar --exclude='*/node_modules' --exclude='*/vendor' -czvf archive.tar.gz .
end
