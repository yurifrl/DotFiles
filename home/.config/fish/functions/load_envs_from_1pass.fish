function load_envs_from_1pass
    # Set the name or UUID of the 1Password item containing your environment variables
    set -l item_name_or_uuid "Local Envs Vars"

    # Fetch the item from 1Password and parse JSON output
    set -l envs (op item get $item_name_or_uuid --format json | jq -r '.fields[] | "\(.label)=\(.value)"')

    # Split the output by newline and process each line
    for line in (string split "\n" $envs)
        # Split each line into key and value
        set -l key (echo $line | cut -d '=' -f 1)
        set -l value (echo $line | cut -d '=' -f 2-)

        # Set the environment variable
        set -gx $key $value
    end
end
