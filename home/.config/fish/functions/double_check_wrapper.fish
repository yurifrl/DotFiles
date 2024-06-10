function confirm_command --on-event fish_preexec
    if test "$skip_confirmation" = "true"
        return
    end

    set -l command_verbs_list "kubectl/k/echo:delete,destroy,apply" "istioctl:all"
    set -l cmd $argv
    set -l prompt_needed 0

    for cv_pair in $command_verbs_list
        set -l pair (string split ':' $cv_pair)
        set -l command_group $pair[1]
        set -l verbs $pair[2]

        set -l command_list (string split '/' $command_group)
        for command in $command_list
            if not string match -q "$command*" $cmd
                continue
            end

            if string match -q "*all*" $verbs
                set prompt_needed 1
                break
            end

            set -l verb_list (string split ',' $verbs)
            for verb in $verb_list
                if test "$cmd" = "$command $verb"
                    set prompt_needed 1
                    break
                end
            end
        end

        if test $prompt_needed -eq 1
            break
        end
    end

    if test $prompt_needed -eq 1
        set -l current_ns (kubectl config view --minify --output 'jsonpath={..namespace}')
        set -l current_cluster (kubectl config current-context)

        set_color red
        echo "cluster: $current_cluster"
        if test -n "$current_ns"
            echo "namespace: $current_ns"
        end
        set_color yellow
        echo "command: $cmd"
        set_color normal
        echo ""
        echo "🔒 Are you sure you want to run ? (y/n)"

        read -l confirm
        if test "$confirm" != "y"
            echo "Command aborted."
            commandline ""
        end
    end
end
