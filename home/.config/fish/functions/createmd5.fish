function createmd5
    set -l user ""
    set -l password ""

    while set -q argv[1]
        switch $argv[1]
            case -p
                set password $argv[2]
                set -e argv[1..2]
            case -u
                set user $argv[2]
                set -e argv[1..2]
            case '*'
                echo "Unknown option: $argv[1]"
                return 1
        end
    end

    # Generate the MD5 hash
    set -l hash (echo -n "md5"; md5 -qs "$password$user")

    # Print the results
    echo $hash | pbcopy
    echo "User: $user"
    echo "Password: $password"
    echo "MD5 Hash: $hash"
end

