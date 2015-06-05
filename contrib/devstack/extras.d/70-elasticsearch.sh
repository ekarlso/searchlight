# check for service enabled
if is_service_enabled  elasticsearch; then

    if [[ "$1" == "source" ]]; then
        # Initial source of lib script
        source $TOP_DIR/lib/elasticsearch
    fi

    if [[ "$1" == "stack" && "$2" == "install" ]]; then
        echo_summary "Installing ElasticSearch"
        install_elasticsearch

    elif [[ "$1" == "stack" && "$2" == "post-config" ]]; then
        echo_summary "Configuring ElasticSearch"
        configure_elasticsearch

    elif [[ "$1" == "stack" && "$2" == "extra" ]]; then
        echo_summary "Initializing ElasticSearch"
        #init_elasticsearch

        echo_summary "Starting ElasticSearch"
        start_elasticsearch
    fi

    if [[ "$1" == "unstack" ]]; then
        stop_elasticsearch
    fi

    if [[ "$1" == "clean" ]]; then
        echo_summary "Cleaning ElasticSearch"
        cleanup_elasticsearch
    fi
fi
