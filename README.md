# Using the relocatable tarball

## Installing

Ungzip/untar the tarball...

    $ tar -xzvf /tmp/couchbase-server-community_x86_64_1.8.1-937-rel-reloc.tar.gz

It will extract into a 'couchbase' directory.

Run the "reloc.sh INSTALL_DIR" script.  The INSTALL_DIR is the
absolute path of the 'couchbase' directory.  For example, after the
previous step...

    $ cd couchbase
    $ ./bin/reloc.sh /home/steve/couchbase
    relocating bin/curl
    relocating bin/curl.bin
    relocating bin/isasladm
    relocating bin/isasladm.bin
    ...
    $

## Starting the couchbase-server...

    $ ./bin/couchbase-server
    The maximum number of open files for the couchbase user is set too low.
    It must be at least 10240. Normally this can be increased by adding
    the following lines to /etc/security/limits.conf:
    
    couchbase              soft    nofile                  <value>
    couchbase              hard    nofile                  <value>
    
    Where <value> is greater than 10240.
    Erlang R14B03 (erts-5.8.4) [source] [64-bit] [smp:2:2] [rq:2] [async-threads:16] [hipe] [kernel-poll:false]
    
    Eshell V5.8.4  (abort with ^G)
    1>
    =PROGRESS REPORT==== 26-Jun-2012::21:17:49 ===
              supervisor: {local,sasl_safe_sup}
                 started: [{pid,<0.48.0>},
                           {name,alarm_handler},
                           {mfargs,{alarm_handler,start_link,[]}},
                           {restart_type,permanent},
                           {shutdown,2000},
                           {child_type,worker}]
    ...

## Configuring the server...

Point your web-browser to http://HOST:8091 and follow the initial
configuration screens.

# Running the server dettached/background...

If you want to run the server without stdin, dettached from the terminal (so, similar to running it as a service), use...

    ./bin/couchbase-server -- -noinput -detacched

Then to stop the running, background couchbase-server, use...

    ./bin/couchbase-server -k

# Tips/recommendations...

Please to update your firewall configuration to allow connections to
the following ports: 11211, 11210, 11209, 4369, 8091 and from 21100 to
21299.  (You may need root to do this.)

Change your ulimits to allow more file descriptors.

You may want to mount production filesystems (also need root to do
this).

Consider enabling core dumps via ./bin/cbenable_core_dumps.sh (need
root to do this).

# To build the relocatable tarball...

See the Makefile and the 'make reloc' target.

# Questions / support

Contact: support@couchbase.com
