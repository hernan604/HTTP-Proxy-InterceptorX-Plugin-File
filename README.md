# NAME

HTTP::Proxy::InterceptorX::Plugin::File - overwrite the response content with file content

# SYNOPSIS

    package My::Custom::Proxy;
    use Moose;
    extends qw/HTTP::Proxy::Interceptor/;
    with qw/
        HTTP::Proxy::InterceptorX::Plugin::File
    /;
    1;

    my $p = My::Custom::Proxy->new(
      config_path => 'config_file.pl',
      port        => 9919,
    );

    $p->start;
    1;

# CONFIG

create a config\_file.pl

    {
        "http://some.site.com/some/url.htm" => {
            File => "/home/user/files/some_file.htm"
        },
    }

You will be point urls to Files 

Start the proxy

# DESCRIPTION

HTTP::Proxy::InterceptorX::Plugin::File allows you to point urls to local files and have the response content loaded from a local file.

# AUTHOR

Hernan Lopes <hernan@cpan.org>

# COPYRIGHT

Copyright 2013- Hernan Lopes

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO
