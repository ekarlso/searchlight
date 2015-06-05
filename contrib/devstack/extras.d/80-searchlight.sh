# check for service enabled
if is_service_enabled searchlight; then

    if [[ "$1" == "source" ]]; then
        # Initial source of lib script
        source $TOP_DIR/lib/searchlight
    fi

    if [[ "$1" == "stack" && "$2" == "install" ]]; then
        echo_summary "Installing Searchlight"
        install_searchlight

        echo_summary "Installing Searchlight Client"
        #install_searchlightclient

        #if is_service_enabled horizon; then
        #    echo_summary "Installing Searchlight Dashboard"
        #    install_searchlight_dashboard
        #fi

    elif [[ "$1" == "stack" && "$2" == "post-config" ]]; then
        echo_summary "Configuring Searchlight"
        configure_searchlight

        if is_service_enabled key; then
            echo_summary "Creating Searchlight Keystone Accounts"
            create_searchlight_accounts
        fi

    elif [[ "$1" == "stack" && "$2" == "extra" ]]; then
        echo_summary "Initializing Searchlight"
        init_searchlight

        echo_summary "Starting Searchlight"
        start_searchlight
    fi

    if [[ "$1" == "unstack" ]]; then
        stop_searchlight
    fi

    if [[ "$1" == "clean" ]]; then
        echo_summary "Cleaning Searchlight"
        cleanup_searchlight
    fi
fi
