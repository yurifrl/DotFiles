function switch_remote_to_ssh
    # Get the current Git remote URL
    set remote_url (git remote get-url origin)

    # Extract the organization and repository name
    set remote_url (string replace -r '^(https://github.com/|git@github.com:)?(.*?)(\.git)?$' '$2' -- $remote_url)
    set -l parts (string split '/' -- $remote_url)
    if test (count $parts) -eq 2
        set org $parts[1]
        set repo $parts[2]

        # Build the new SSH URL
        set new_url "git@github.com:$org/$repo.git"

        # Set the new remote URL
        git remote set-url origin $new_url
        echo "Remote URL changed to: $new_url"
    else
        echo "Error: Could not parse the remote URL."
    end
end
